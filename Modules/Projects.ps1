function Vim-Open-Project {
	param(
		[string]$Path
	)

	Set-Location $Path
	nvim .
}
function Open-Project {
	param(
		[string]$Path
	)

	Set-Location $Path
}

function VPY {Vim-Open-Project "D:\Python"}
function VJS {Vim-Open-Project "D:\JS"}
function VWEB {Vim-Open-Project "D:\WEB"}
function VDESK {Vim-Open-Project "C:\Users\Mahdi_Nub\Desktop"}
function VDOW {Vim-Open-Project "C:\Users\Mahdi_Nub\Downloads"}
function VDOC {Vim-Open-Project "C:\Users\Mahdi_Nub\Documents"}
function VLUA {Vim-Open-Project "C:\Users\Mahdi_Nub\AppData\Local\nvim\lua\custom"}
function VPOW {Vim-Open-Project "C:\Users\Mahdi_Nub\Documents\PowerShell"}

function PY {Open-Project "D:\Python"}
function JS {Open-Project "D:\JS"}
function WEB {Open-Project "D:\WEB"}
function DESK {Open-Project "C:\Users\Mahdi_Nub\Desktop"}
function DOW {Open-Project "C:\Users\Mahdi_Nub\Downloads"}
function DOC {Open-Project "C:\Users\Mahdi_Nub\Documents"}
function LUA {Open-Project "Directory: C:\Users\Mahdi_Nub\AppData\Local\nvim\lua\custom"}
function POW {Open-Project "C:\Users\Mahdi_Nub\Documents\PowerShell"}
