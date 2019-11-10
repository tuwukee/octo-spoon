<script>
  import { onMount } from "svelte";

  let url = "/v1/products";
  let data = [];
  let new_name = "";
  let new_calories = "";

  onMount(async function() {
    try {
      const response = await fetch(url);
      const json = await response.json();
      data = json.data;
    } catch (error) {
      console.log(error);
    }
  });

  function createProduct() {
    let body = {
      data: {
        type: "products",
        attributes: {
          name: new_name,
          calories: new_calories
        }
      }
    };

    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(body)
    })
    .then((response) => {
      if (response.ok) {
        return response.json()
      } else {
        return Promise.reject({ status: response.status, statusText: response.statusText, body: response.json() });
      }
    })
    .then((new_data) => {
      data.push(new_data);
    })
    .catch((error) => {
      console.log("Error message:", error.statusText);
      error.body.then(body => console.log(body));
    });
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

<div>{JSON.stringify(data)}</div>
<ul>
  {#each data as product}
    <li>
      {JSON.stringify(product)}
    </li>
  {/each}
</ul>
