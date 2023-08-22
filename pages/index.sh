
source config.sh

htmx_page << EOF
  <div class="bg-slate-100 dark:bg-slate-950 dark:text-white grid place-content-center h-screen">
    <div class="flex flex-col gap-8 w-79">

      <div hx-ext="sse" sse-connect="/sse">
      <div hx-get="/reset" hx-trigger="sse:reset" class="hidden"></div>
      <h1 class="text-blue-500 text-4xl justify-center flex">${PROJECT_NAME}</h1>
      <div id="description" class="flex text-center flex-col mb-10 text-gray-600 dark:text-gray-400">
        <p class="italic">It's like Wordle, but multiplayer.</p>
        <p hx-sse="swap:conns">Loading...</p>
      </div>
      <div id="guesses" hx-get="/guess" class="flex flex-col gap-1" hx-trigger="sse:guess">
        $(component '/guess')
      </div>
      </div>
      <p id="error"></p>
      $(component '/form')
      $(component '/keyboard')
    </div>
  </div>
EOF
