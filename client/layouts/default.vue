<template>
  <v-app id="inspire" dark>
    <v-navigation-drawer v-model="drawer" app>
      <v-list-item>
        <div class="pa-2">
          <v-list-item-title class="text-h6 font-weight-bold">
            JAVAN Test
          </v-list-item-title>
          <v-list-item-subtitle>Syahril Syahputra</v-list-item-subtitle>
        </div>
      </v-list-item>
      <v-divider></v-divider>
      <v-list dense nav>
        <v-list-item
          v-for="item in items"
          :key="item.title"
          link
          :to="item.route"
        >
          <template v-slot:prepend>
            <v-icon :icon="item.icon"></v-icon>
          </template>

          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app class="px-3">
      <v-icon @click="drawer = !drawer">mdi-menu</v-icon>
      <v-toolbar-title>Javan Test - By Syahril Syahputra</v-toolbar-title>
      <v-spacer></v-spacer>
      <div class="mt-5">
        <v-switch
          v-model="isDark"
          :label="`Dark Mode: ${isDark ? 'On' : 'Off'}`"
        ></v-switch>
      </div>
    </v-app-bar>

    <v-main>
      <div class="pa-4">
        <slot />
      </div>
    </v-main>
  </v-app>
</template>
<script setup lang="ts">
import { ref, watch } from "vue";
import { useTheme } from "vuetify";
const drawer = ref(false);
const isDark = ref(false);

watch(isDark, async (newVal, oldVal) => {
  // theme.global.name.value = theme.global.current.value.dark ? "light" : "dark";
  theme.global.name.value = !newVal ? "light" : "dark";
});

const theme = useTheme();

const items = ref([
  { route: "/", title: "People", icon: "mdi-account-multiple" },
  { route: "/assets", title: "Asset", icon: "mdi-tablet-cellphone" },
]);

const testing = () => {
  theme.global.name.value = theme.global.current.value.dark ? "light" : "dark";
};
</script>
