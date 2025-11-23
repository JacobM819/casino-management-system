FROM node:20

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

ENV WATCHPACK_POLLING=true
CMD ["npm", "run", "dev"]