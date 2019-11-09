<script>
  import { onMount } from "svelte";

  let url = "/v1/entries";
  let data = [];

  onMount(async function() {
    try {
      const response = await fetch(url);
      const json = await response.json();
      data = json.data;
    } catch (error) {
      console.log(error);
    }
  });
</script>

<style>
  h1 { color: #FF3E00; }
</style>

<h1>Hello {url}!</h1>
<div>{JSON.stringify(data)}</div>
<ul>
  {#each data as entry}
    <li>
      {JSON.stringify(entry)}
    </li>
  {/each}
</ul>
