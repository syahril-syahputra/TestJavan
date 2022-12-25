<template>
  <client-only>
    <v-dialog v-model="isVisible">
      <v-card>
        <v-card-text class="text-center">
          {{ message }}
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" block @click="$emit('close')">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </client-only>
</template>
<script setup lang="ts">
import { ref, watch } from "vue";
const props = defineProps({
  visible: {
    type: Boolean,
    default: false,
    required: true,
  },
  message: {
    type: String,
    default: "kosong",
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
