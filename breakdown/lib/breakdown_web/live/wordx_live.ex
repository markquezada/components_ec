defmodule BreakdownWeb.WordxLive do
  use BreakdownWeb, :live_view
  alias Breakdown.Game.Core

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:game, Core.new())
     |> assign(:guess, "ABC")}
  end

  def render(assigns) do
    ~H"""
    <pre>
      <%= inspect @game, pretty: true %>
    </pre>
    <p>Hello World</p>
    <.everything guess={@guess} />
    <.move />
    """
  end

  def handle_event("move", _, socket) do
    {:noreply, guess(socket)}
  end

  def guess(socket) do
    new_game = Core.guess(socket.assigns.game, "guess")
    assign(socket, :game, new_game)
  end

  def move(assigns) do
    ~H"""
    <button class="button" phx-click="move">Move!</button>
    """
  end

  def everything(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <header class="flex items-center justify-between gap-6" }>
        <div>
          <h1 class="text-lg font-semibold leading-8 text-zinc-800">
            Hello,
          </h1>
          <p class="mt-2 text-sm leading-6 text-zinc-600">
            World
          </p>
        </div>
      </header>

      <br />
      <br />
      <hr />
      <br />
      <br />

      <div class="grid grid-cols-5 gap-4 text-center font-bold">
        <.letter :for={letter <- split_guess(@guess)} color={:white} letter={letter} />

        <.letter color={:green} letter="G" />
        <.letter color={:yellow} letter="U" />
        <.letter color={:gray} letter="E" />
        <.letter color={:green} letter="S" />
        <.letter color={:yellow} letter="S" />

        <.letter color={:green} letter="G" />
        <.letter color={:yellow} letter="U" />
        <.letter color={:gray} letter="E" />
        <.letter color={:green} letter="S" />
        <.letter color={:yellow} letter="S" />

        <.letter color={:green} letter="G" />
        <.letter color={:yellow} letter="U" />
        <.letter color={:gray} letter="E" />
        <.letter color={:green} letter="S" />
        <.letter color={:yellow} letter="S" />

        <.letter color={:green} letter="G" />
        <.letter color={:yellow} letter="U" />
        <.letter color={:gray} letter="E" />
        <.letter color={:green} letter="S" />
        <.letter color={:yellow} letter="S" />

        <.letter color={:green} letter="G" />
        <.letter color={:yellow} letter="U" />
        <.letter color={:gray} letter="E" />
        <.letter color={:green} letter="S" />
        <.letter color={:yellow} letter="S" />
      </div>

      <br />
      <br />
      <hr />
      <br />
      <br />

      <div class="grid grid-cols-10 gap-3 text-center font-bold">
        <div class="rounded bg-green-600 pt-1 pb-1 text-white">Q</div>
        <div class="rounded bg-yellow-500 pt-1 pb-1 text-white">W</div>
        <div class="rounded bg-gray-500 pt-1 pb-1 text-white">E</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">R</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">T</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">Y</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">U</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">I</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">O</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">P</div>

        <div class="rounded bg-green-600 pt-1 pb-1 text-white">A</div>
        <div class="rounded bg-yellow-500 pt-1 pb-1 text-white">S</div>
        <div class="rounded bg-gray-500 pt-1 pb-1 text-white">D</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">F</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">G</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">H</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">J</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">K</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">L</div>
        <div></div>

        <div></div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">Z</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">X</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">C</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">V</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">B</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">N</div>
        <div class="rounded border-2 border-solid border-slate-600 pt-1 pb-1 text-black">M</div>
        <div></div>
        <div></div>
      </div>
    </div>
    """
  end

  def letter(assigns) do
    ~H"""
    <div class={[letter_color(@color), "pt-2 pb-2 rounded"]}>
      <%= @letter %>
    </div>
    """
  end

  defp split_guess(guess) do
    guess |> String.pad_trailing(5) |> String.graphemes()
  end

  defp letter_color(:green) do
    ["bg-green-600", "text-white"]
  end

  defp letter_color(:yellow) do
    ["bg-yellow-500", "text-white"]
  end

  defp letter_color(:gray) do
    ["bg-gray-500", "text-white"]
  end

  defp letter_color(_) do
    ["border-2", "border-gray-500"]
  end
end
