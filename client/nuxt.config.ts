// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    css: ['vuetify/lib/styles/main.sass'],
    build: {
        transpile: ['vuetify'],
    },
    vite: {
        define: {
            'process.env.DEBUG': false,
        },
    },
    modules: [
        '@vueuse/nuxt',
    ],
    runtimeConfig: {
        public: {
            baseURL: process.env.BASE_URL,
        },
    },
})
