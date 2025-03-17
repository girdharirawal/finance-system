# ---- Step 1: Build Stage (Using Alpine with Build Arguments) ----
    ARG NODE_VERSION=22-alpine  # Default Node.js version
    FROM node:${NODE_VERSION} as builder
    
    # Set working directory
    WORKDIR /app
    
    # Build argument for environment (default to "production")
    ARG BUILD_ENV=production
    ENV NODE_ENV=$BUILD_ENV
    
    # Install dependencies (no cache for smaller size)
    COPY package.json package-lock.json ./
    RUN npm ci --no-progress --prefer-offline
    
    # Copy application source
    COPY . ./
    
    # Build the React application
    RUN npm run build
    
    # ---- Step 2: Serve with Nginx ----
    FROM nginx:alpine
    
    # Set working directory
    WORKDIR /usr/share/nginx/html
    
    # Remove default Nginx static assets
    RUN rm -rf ./*
    
    # Copy built React files from the builder stage
    COPY --from=builder /app/build ./
    
    # Expose the default Nginx port
    EXPOSE 80
    
    # Start Nginx
    CMD ["nginx", "-g", "daemon off;"]
    