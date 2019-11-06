<script>
  import { onMount } from "svelte";

  let url = "/v1/entries";
  let data = [];

  onMount(async function() {
    const response = await fetch(url).catch(e => console.log("Error: ", e.message));
    const json = await response.json().catch(e => console.log("Error: ", e.message));
    data = json.data;
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
