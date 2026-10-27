# calculiva-mcp

Model Context Protocol (MCP) server of the **Calculiva Cut Planner**, as a container image: an AI assistant gets
plank flooring, trim board and wallpaper orders computed from an actual cut layout (cartons, boards and rolls to
buy, the cut list, the offcuts) instead of an area multiplied by a flat waste percentage.

The image installs the [`calculiva-mcp`](https://www.npmjs.com/package/calculiva-mcp) npm package, which runs the
same code as the calculators on [calculiva.com](https://calculiva.com/) and as the hosted server at
`https://mcp.calculiva.com/mcp`. The tools are read-only: no account, no key, no network call, nothing stored.

## Use it

Docker Hub image: `tresor4k/calculiva-mcp` (linux/amd64, linux/arm64). The server speaks MCP over stdio, so the
client starts it with `-i`:

```json
{
  "mcpServers": {
    "calculiva": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "tresor4k/calculiva-mcp"]
    }
  }
}
```

Without Docker: `npx -y calculiva-mcp` (Node.js 20 or later). Without installing anything: a client that accepts
remote MCP connectors can use `https://mcp.calculiva.com/mcp` (Streamable HTTP).

## Tools

| Tool | What it returns | Same calculation on the site |
|---|---|---|
| `plan_flooring_order` | Laminate, vinyl or engineered plank flooring for 1 to 12 rooms, rectangles or L shapes: cartons to buy, every cut piece traced to its source plank, offcuts carried from one room to the next, 8 layout scenarios. | [Flooring calculator](https://calculiva.com/flooring/flooring-calculator/) |
| `plan_trim_order` | Board and batten, wainscoting or picture frame molding on one wall: spacing, the cut list and how many boards of each retail length to buy. | [Board and batten calculator](https://calculiva.com/wall-paneling/board-and-batten-calculator/) |
| `plan_wallpaper_order` | Rolls to buy from the walls, openings and the roll label (width, length, pattern repeat, match), with the straight / half-drop / random comparison. | [Wallpaper calculator](https://calculiva.com/wallpaper/wallpaper-calculator/) |
| `build_order_sheet` | One order sheet for a whole project from the three plans above, with a CSV. | — |

How each calculation works: [How we calculate](https://calculiva.com/how-we-calculate/).

## Licence

MIT. Calculiva — <https://calculiva.com/>
