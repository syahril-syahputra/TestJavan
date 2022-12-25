<template>
  <client-only>
    <v-dialog v-model="isVisible" persistent>
      <v-card>
        <v-card-title class="text-h5 text-center">
          {{ title }}
        </v-card-title>
        <v-card-text class="text-center">{{ message }}</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green-darken-1" variant="text" @click="$emit('close')">
            Cancel
          </v-btn>
          <v-btn color="green-darken-1" variant="text" @click="$emit('yes')">
            Yes. Delete All
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog></client-only
  >
</template>

<script setup lang="ts">
import { ref, watch } from "vue";
const props = defineProps({
  visible: {
    type: Boolean,
    default: true,
    required: true,
  },
  title: {
    type: String,
    default: "",
  },
  message: {
    type: String,
    default: "",
  },
});
const isVisible = ref(props.visible);
watch(
  () => props.visible,
  (newVal, oldVal) => {
    isVisible.value = newVal;
  }
);
</script>
