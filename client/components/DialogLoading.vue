<template>
  <client-only>
    <v-dialog v-model="isVisible" :scrim="false" persistent>
      <v-card color="primary">
        <v-card-text>
          Please Wait
          <v-progress-linear
            indeterminate
            color="white"
            class="mb-0"
          ></v-progress-linear>
        </v-card-text>
      </v-card> </v-dialog
  ></client-only>
</template>
<script setup lang="ts">
import { ref, watch } from "vue";
const props = defineProps({
  visible: {
    type: Boolean,
    default: false,
    required: true,
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
