<script lang="ts">
    import type { Msg } from "./elmBridge";
    import { elm_main } from "./elmBridge";
    import Button from "./lib/Button.svelte";

    $: console.log($elm_main);

    const createClickHandler = (type: Msg) => {

        return () => {
            $elm_main = type;
        }
    }

</script>

<main>
    <Button on:click={createClickHandler("Increment")}>Increment</Button>
    <Button on:click={createClickHandler("Decrement")}>Decrement</Button>
</main>

<style>
    :root {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
            Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
    }

    main {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
    }
</style>
