local TweenService = game:GetService("TweenService")
local playButton = script.Parent
local screenGui = playButton:FindFirstAncestorWhichIsA("ScreenGui")

-- Tween settings
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Function to fade out all UI elements inside the ScreenGui
local function fadeOutScreenGui()
	for _, ui in pairs(screenGui:GetDescendants()) do
		if ui:IsA("Frame") or ui:IsA("TextLabel") or ui:IsA("TextButton") or ui:IsA("ImageLabel") then
			-- Fade out background
			local bgTween = TweenService:Create(ui, tweenInfo, {
				BackgroundTransparency = 1
			})
			bgTween:Play()

			-- Fade out text (if it's a label or button)
			if ui:IsA("TextLabel") or ui:IsA("TextButton") then
				local textTween = TweenService:Create(ui, tweenInfo, {
					TextTransparency = 1
				})
				textTween:Play()
			end

			-- Fade out image (if it's an image label)
			if ui:IsA("ImageLabel") then
				local imageTween = TweenService:Create(ui, tweenInfo, {
					ImageTransparency = 1
				})
				imageTween:Play()
			end
		end
	end

	-- After fade-out is complete, disable the entire GUI
	task.delay(1.1, function()
		screenGui.Enabled = false
	end)
end

-- Connect button click to fade-out function
playButton.MouseButton1Click:Connect(fadeOutScreenGui)
