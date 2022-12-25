<template>
  <div>
    <v-progress-circular
      v-if="proses.isLoading"
      indeterminate
      color="primary"
    ></v-progress-circular>
    <v-alert
      v-else-if="proses.error.length > 0"
      border="top"
      color="red lighten-2"
      dark
    >
      {{ proses.error }}
    </v-alert>
    <v-container v-else>
      <v-btn
        prepend-icon="mdi-plus"
        variant="tonal"
        class="mb-4"
        @click="isShowForm = true"
      >
        Add New
      </v-btn>

      <v-table>
        <thead>
          <tr>
            <th class="text-left">No</th>
            <th class="text-left">Asset Name</th>
            <th class="text-right">Asset Price</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in proses.result" :key="item.idAssets">
            <td>{{ index + 1 }}</td>
            <td>{{ item.titleAssets }}</td>
            <td align="right">{{ item.price }}</td>
            <td>
              <v-btn
                prepend-icon="mdi-delete"
                variant="tonal"
                @click="deleteData(item.idAssets)"
                class="mr-4"
              >
                Delete
              </v-btn>

              <v-btn
                prepend-icon="mdi-pencil"
                variant="tonal"
                @click="editData(item)"
              >
                Edit
              </v-btn>
            </td>
          </tr>
        </tbody>
      </v-table>
    </v-container>

    <FormAsset
      :visible="isShowForm"
      @close="isShowForm = false"
      @send="sendData"
    ></FormAsset>
    <dialog-loading :visible="isLoading"></dialog-loading>
    <dialog-alert :visible="isAlertShow" :message="messageAlert"></dialog-alert>
    <dialog-confirm
      :visible="isConfirmShow"
      title="Are you sure want to delete this Asset?"
      message="all data will be delete and all person who have this asset will be lose this asset"
      @close="isConfirmShow = false"
      @yes="doDelete"
    ></dialog-confirm>
    <FormAssetEdit
      :visible="isShowFormEdit"
      :listPeople="proses.result"
      :old-name="selectedName"
      :old-price="selectedPrice"
      @close="isShowFormEdit = false"
      @send="updateData"
    ></FormAssetEdit>
  </div>
</template>
<script setup lang="ts">
import { useFetch } from "@vueuse/core";
import { onMounted, reactive, ref } from "vue";
const isShowForm = ref(false);
const isLoading = ref(false);
const isAlertShow = ref(false);
const messageAlert = ref("");
const isConfirmShow = ref(false);
const selectedId = ref(0);
const selectedName = ref("");
const selectedPrice = ref(0);
const isShowFormEdit = ref(false);
const proses = reactive({
  isLoading: true,
  error: "",
  result: [] as any[],
});

onMounted(() => {
  refreshData();
});

const sendData = async (payload: Object) => {
  isShowForm.value = false;

  const { isFetching, error, data } = await useFetch(
    "http://localhost:3500/assets",
    {},
    { immediate: true }
  )
    .post(payload)
    .json();
  refreshData();
  isLoading.value = isFetching.value;
};
const updateData = async (payload: Object) => {
  isShowFormEdit.value = false;
  isLoading.value = true;
  const { isFetching, error, data } = await useFetch(
    "http://localhost:3500/assets/" + selectedId.value,
    {},
    { immediate: true }
  )
    .put(payload)
    .json();
  refreshData();
  isLoading.value = isFetching.value;
};
const doDelete = async (payload: Object) => {
  isConfirmShow.value = false;
  isLoading.value = true;
  const { isFetching, error, data } = await useFetch(
    "http://localhost:3500/assets/" + selectedId.value,
    {},
    { immediate: true }
  )
    .delete(selectedId.value)
    .json();
  refreshData();
  isLoading.value = isFetching.value;
};
const refreshData = async () => {
  const { isFetching, error, data } = await useFetch(
    "http://localhost:3500/assets",
    {},
    { immediate: true }
  )
    .get()
    .json();
  proses.isLoading = isFetching.value;
  proses.error = error.value || "";
  proses.result = data.value;
};
const deleteData = (id: number) => {
  // dialogConfirm.isShow = true;
  selectedId.value = id;
  isConfirmShow.value = true;
};

const editData = (data: any) => {
  isShowFormEdit.value = true;
  selectedId.value = data.idAssets;
  selectedName.value = data.titleAssets;
  selectedPrice.value = data.price;
};
</script>
