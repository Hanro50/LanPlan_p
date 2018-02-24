<h1>Basic Infor:</h1>
1) You're required to have "Microsoft Access Database Engine 2010 Redistributable" package installed in order to run these package
https://www.microsoft.com/en-za/download/details.aspx?id=13255

2) When opening the editor...open DMMainLinkLibary_u.pass first or else the editor will forget it exists. Its due to a bug in Delphi 2010

3) The default admin login account is adm and the password is 123 
	(If you plan to use this application for something more serious, I suggest banning the adm account)
	
4) This was for a school project; my only request is that you just credit me if you decide to use this for something else 

<h1>How to read files:</h1>
The GF folder contains form components. The DM folder contains the Datamodual components. If you're just interested in the code then check out the .pas files since they're the human readable uncompelled basic object Pascal code.   

The .dfm files contains human readable data relating to the gui components within the program and the .dcu files aren't human unreadable. 
The other human readable file of note is the .dpr file which contains the order in which each module is initialized and a list of each custom unit file this program utilizes. 
