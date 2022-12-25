<template>
  <client-only>
    <v-dialog v-model="isVisible" persistent>
      <v-card>
        <v-card-title>
          <span class="text-h5">Person</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="Name">
                <v-text-field
                  v-model="name"
                  label="Legal first name*"
                  required
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <span>Gender</span>
                <v-radio-group v-model="gender">
                  <v-radio label="Male" :value="1"></v-radio>
                  <v-radio label="Female" :value="2"></v-radio>
                </v-radio-group>
              </v-col>
              <v-col cols="12">
                <v-autocomplete
                  label="Parent"
                  :items="[{ id: 0, name: 'No Parent' }, ...listPeople]"
                  item-title="name"
                  item-value="id"
                  v-model="parent"
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
  listPeople: {
    type: Array,
    default: () => [],
    required: true,
  },
  oldName: {
    type: String,
    default: "",
  },
  oldGender: {
    type: Number,
    default: 0,
  },
  oldParent: {
    type: Number,
    default: 0,
  },
});
const isVisible = ref(props.visible);
const error = ref("");

const name = ref("");
const gender = ref(0);
const parent = ref(0);

watch(
  () => props.visible,
  (newVal, oldVal) => {
    isVisible.value = newVal;
    if (newVal) {
      name.value = props.oldName;
      gender.value = props.oldGender;
      parent.value = props.oldParent;
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

  emit("send", {
    name: name.value,
    gender: gender.value,
    parent: parent.value,
  });
};
</script>
