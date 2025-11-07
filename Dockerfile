FROM node:18-alpine AS builder
WORKDIR /app
COPY app/package.json app/package-lock.json* ./
RUN npm ci --production=false
COPY app/. .

RUN npm run lint || true


FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src
EXPOSE 3000
CMD ["node", "src/index.js"]
