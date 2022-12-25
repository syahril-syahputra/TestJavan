<template>
  <client-only>
    <v-dialog v-model="isVisible" persistent>
      <v-card>
        <v-card-title>
          <span class="text-h5">Add Asset To Person</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="Name">
                <v-text-field
                  v-model="name"
                  label="Your Name*"
                  readonly
                  required
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-autocomplete
                  label="Parent"
                  :items="listAsset"
                  item-title="titleAssets"
                  item-value="idAsset"
                  return-object
                  v-model="selectedParent"
                ></v-autocomplete>
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
            Add
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
  listAsset: {
    type: Array,
    default: () => [],
    required: true,
  },
  oldName: {
    type: String,
    default: "",
    required: true,
  },
});
const isVisible = ref(props.visible);
const error = ref("");

const name = ref("");
const selectedParent = ref(null as any);

watch(
  () => props.visible,
  (newVal, oldVal) => {
    isVisible.value = newVal;
    if (newVal) {
      name.value = props.oldName;
      selectedParent.value = null;
    }
  }
);

const emit = defineEmits(["send"]);

const validate = () => {
  error.value = "";
  if (name.value.length <= 3) {
    error.value = "Your Name to short";
    return;
  }

  if (selectedParent.value === null) {
    error.value = "Please Select Assets";
    return;
  }

  emit("send", selectedParent.value.idAssets);
};
</script>
