local Rayfield = loadstring(game:HttpGet('https://sirius.menu'))()

local Window = Rayfield:CreateWindow({
   Name = "Império Hub",
   LoadingTitle = "Império Hub",
   LoadingSubtitle = "Execução via GitHub",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false, 
})

-- ABA ÚNICA (PLAYER)
local Tab = Window:CreateTab("Player", 4483362458) 

Tab:CreateSection("Movimentacao")
Tab:CreateInput({
   Name = "Velocidade",
   PlaceholderText = "Ex: 50",
   Callback = function(t) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(t) or 16 end,
})

Tab:CreateInput({
   Name = "Pulo",
   PlaceholderText = "Ex: 100",
   Callback = function(t) 
      local h = game.Players.LocalPlayer.Character.Humanoid
      h.JumpPower = tonumber(t) or 50
      h.UseJumpPower = true
   end,
})

Tab:CreateSection("Trapacas")
Tab:CreateToggle({
   Name = "Pulo Infinito",
   CurrentValue = false,
   Callback = function(v)
      _G.InfJ = v
      game:GetService("UserInputService").JumpRequest:Connect(function()
         if _G.InfJ then game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping") end
      end)
   end,
})

Tab:CreateToggle({
   Name = "Atravessar Paredes (Noclip)",
   CurrentValue = false,
   Callback = function(v)
      _G.Noc = v
      game:GetService("RunService").Stepped:Connect(function()
         if _G.Noc and game.Players.LocalPlayer.Character then
            for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if p:IsA("BasePart") then p.CanCollide = false end
            end
         end
      end)
   end,
})

Tab:CreateToggle({
   Name = "Ficar Invisivel",
   CurrentValue = false,
   Callback = function(v)
      local t = v and 1 or 0
      for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
         if (p:IsA("BasePart") or p:IsA("Decal")) and p.Name ~= "HumanoidRootPart" then p.Transparency = t end
      end
   end,
})

Tab:CreateSection("Teleportes")
Tab:CreateLabel("Não Está Funcionando", Color3.fromRGB(255, 255, 0))

