<template>
  <client-only>
    <v-dialog v-model="isVisible" persistent>
      <v-card>
        <v-card-title>
          <span class="text-h5">Asset</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="Name">
                <v-text-field
                  v-model="name"
                  label="Asset Name*"
                  required
                ></v-text-field>
                <v-text-field
                  v-model="price"
                  label="Asset Price*"
                  required
                ></v-text-field>
              </v-col>
            </v-row>
            <v-alert type="error" v-if="error.length > 0">{{ error }}</v-alert>
          </v-container>
          <small>*indicates required field</small>
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue-darken-1" variant="text" @click="$emit('close')">
            Close
          </v-btn>
          <v-btn color="blue-darken-1" variant="text" @click="validate">
            Save
          </v-btn>
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
  data: {
    type: Object,
    default: null,
  },
});
const isVisible = ref(props.visible);
const error = ref("");

const name = ref("");
const price = ref(0);

watch(
  () => props.visible,
  (newVal, oldVal) => {
    isVisible.value = newVal;
    if (newVal) {
      name.value = "";
    }
  }
);

const emit = defineEmits(["send"]);

const validate = () => {
  error.value = "";
  if (name.value.length <= 3) {
    error.value = "Asset Name to short";
    return;
  }
  if (isNaN(price.value)) {
    error.value = "Price must a number";
    return;
  }
  emit("send", {
    title: name.value,
    price: price.value,
  });
};
</script>
