FROM node:18

RUN mkdir /app 
RUN npm install -g pnpm
RUN git clone https://github.com/elk-zone/elk.git  /app/elk
WORKDIR /app/elk

RUN pnpm install --frozen-lockfile && pnpm nuxi prepare

RUN pnpm build

ENTRYPOINT [ "pnpm","start" ]