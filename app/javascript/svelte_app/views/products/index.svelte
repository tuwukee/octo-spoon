<script>
  import { onMount } from "svelte";
  import Pagination from "../shared/pagination"

  export let page_id = 1;
  const url = "/v1/products";
  const ui_url = "/products";

  let products = [];
  let meta = {
    total_pages: 0,
    current_page: 1
  };
  let new_name = "";
  let new_calories = "";

  onMount(() => getProducts());

  function setPageId(new_page_id) {
    page_id = new_page_id;
    getProducts();
  }

  async function getProducts() {
    const products_url = url + "?page[number]=" + page_id;

    try {
      const response = await fetch(products_url);
      const json = await response.json();
      if (response.ok) {
        products = json.data;
        meta = json.meta;
      } else {
        // TODO: flash message
        console.log("Errors:", json);
      }
    } catch (error) {
      console.log("Exception:", error);
    }
  }

  async function destroyProduct(product) {
    let result = confirm("Are you sure?");
    if (result == false) return false;

    const destroy_url = "/v1/products/" + product.id;

    try {
      const response = await fetch(destroy_url, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json"
        }
      })

      if (response.ok) {
        products = products.filter(obj => obj.id !== product.id);
      } else {
        const json = await response.json();
        // TODO: flash message
        console.log("Errors:", json);
      }
    } catch (exception) {
      console.log("Exception:", exception);
    }
  }

  async function updateProduct(product) {
    const update_url = "/v1/products/" + product.id;
    const body = { data: product };

    try {
      const response = await fetch(update_url, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(body)
      })
      const json = await response.json();

      if (response.ok) {
        // Do nothing
      } else {
        // TODO: flash message
        console.log("Errors:", json);
      }
    } catch (exception) {
      console.log("Exception:", exception);
    }
  }

  async function createProduct() {
    const body = {
      data: {
        type: "products",
        attributes: {
          name: new_name,
          calories: new_calories
        }
      }
    };

    try {
      const response = await fetch(url, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(body)
      })
      const json = await response.json();

      if (response.ok) {
        products = [...products, json.data];
        new_name = "";
        new_calories = "";
      } else {
        // TODO: flash message
        console.log("Errors:", json);
      }
    } catch (exception) {
      console.log("Exception:", exception);
    }
  }
</script>

<style>
  h1 { color: #FF3E00; }
</style>

<h1>Products</h1>

<label><input bind:value={new_name} placeholder="Product Name"></label>
<label><input bind:value={new_calories} placeholder="Calories per 100g"></label>

<div class="buttons">
  <button on:click={createProduct} disabled="{!new_name || !new_calories}">Create Product</button>
</div>

<table id="products">
  <tr>
    <th>Name</th>
    <th>Calories</th>
    <th>Protein</th>
    <th>Carbohydrate</th>
    <th>Fat</th>
    <th>Cellulose</th>
    <th />

  </tr>
  {#each products as product}
    <tr>
      <td contenteditable="true" bind:textContent={product.attributes.name} on:blur={() => updateProduct(product)} />
      <td contenteditable="true" bind:textContent={product.attributes.calories} on:blur={() => updateProduct(product)} />
      <td contenteditable="true" bind:textContent={product.attributes.protein} on:blur={() => updateProduct(product)} />
      <td contenteditable="true" bind:textContent={product.attributes.carbohydrate} on:blur={() => updateProduct(product)} />
      <td contenteditable="true" bind:textContent={product.attributes.fat} on:blur={() => updateProduct(product)} />
      <td contenteditable="true" bind:textContent={product.attributes.cellulose} on:blur={() => updateProduct(product)} />
      <td>
        <button on:click={() => destroyProduct(product)}>Destroy</button>
      </td>
    </tr>
  {/each}
</table>

<Pagination meta={meta} url={ui_url} setPageId={setPageId} />

