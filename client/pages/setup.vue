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
      <v-table>
        <thead>
          <tr>
            <th class="text-left">No</th>
            <th class="text-left">Name</th>
            <th class="text-left">List Asset</th>
            <th class="text-left"></th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(item, index) in proses.result" :key="item.id">
            <td>{{ index + 1 }}</td>
            <td>{{ item.name }}</td>
            <td>
              <v-chip
                closable
                v-for="asset in item.data_assets"
                class="mr-2"
                @click:close="deleteAssets(asset.idPeopleAssets)"
              >
                {{ asset.titleAssets }}
              </v-chip>
            </td>
            <td>
              <v-btn
                prepend-icon="mdi-plus-circle"
                variant="tonal"
                @click="addAsset(item)"
              >
                Add Asset
              </v-btn>
            </td>
          </tr>
        </tbody>
      </v-table>
    </v-container>
    <FormAddAssets
      :visible="isShowForm"
      :list-asset="assets.result"
      :old-name="selectedName"
      @close="isShowForm = false"
      @send="sendData"
    ></FormAddAssets>
  </div>
</template>
<script setup lang="ts">
import { useFetch } from "@vueuse/core";
import { onMounted, reactive, ref } from "vue";
const isShowForm = ref(false);
const selectedId = ref(0);
const selectedName = ref("");

const proses = reactive({
  isLoading: true,
  error: "",
  result: [] as any[],
});
const assets = reactive({
  isLoading: true,
  error: "",
  result: [] as any[],
});

onMounted(() => {
  refreshData();
});

const refreshData = async () => {
  const { isFetching, error, data } = await useFetch(
    "http://localhost:3500/people/detail",
    {},
    { immediate: true }
  )
    .get()
    .json();
  proses.isLoading = isFetching.value;
  proses.error = error.value || "";
  proses.result = data.value.map(
    (item: { id: any; name: any; data_assets: any }) => {
      return {
        id: item.id,
        name: item.name,
        data_assets: JSON.parse(item.data_assets),
      };
    }
  );

  const getAsset = await useFetch(
    "http://localhost:3500/assets",
    {},
    { immediate: true }
  )
    .get()
    .json();
  assets.isLoading = getAsset.isFetching.value;
  assets.error = getAsset.error.value || "";
  assets.result = getAsset.data.value;
};
const deleteAssets = async (id: any) => {
  const { isFetching, error, data } = await useFetch(
    "http://localhost:3500/people/asset/" + id,
    {},
    { immediate: true }
  )
    .delete()
    .json();
  refreshData();
};
const sendData = async (id: any) => {
  const payload = {
    id: selectedId.value,
    asset: id,
  };
  isShowForm.value = false;
  const { isFetching, error, data } = await useFetch(
    "http://localhost:3500/people/asset",
    {},
    { immediate: true }
  )
    .post(payload)
    .json();
  refreshData();
};
const addAsset = (item: any) => {
  selectedName.value = item.name;
  selectedId.value = item.id;
  isShowForm.value = true;
};
</script>
