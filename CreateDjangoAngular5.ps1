$Proj = Read-Host -Prompt 'Input name of django project:'
#New-Item -ItemType Directory -Force -Path "$($pwd)\$($Proj)"
Do {   
    $AngCreate = Read-Host -Prompt 'Create Angular 5 frontend?(y/n)'
}
While (($AngCreate -ne 'y') -and ($AngCreate -ne 'n'))
if($AngCreate -eq 'y'){
    $Ang = Read-Host -Prompt 'Input name of Angular project:'
}
New-Item -ItemType Directory -Force -Path $pwd"\principal"
cd principal
if(Test-Path $pwd"\myenv"){
    echo 'myenv exists'
    myenv\Scripts\activate
    #python tt.py
}else{
    echo 'Creating virtualenv'
    #virtualenv myenv 
	#myenv\Scripts\activate
	#pip install django 
	#pip install djangorestframework
}
if(Test-Path "$($pwd)\$($Proj)"){
    echo "project $($Proj) already created"
}else{
    echo "Creating Project"
    $scriptpath = $MyInvocation.MyCommand.Path
    $dir = Split-Path $scriptpath
    django-admin.py startproject $Proj
}
$stay=$true
Do{
    if(Test-Path "$($pwd)\$($Proj)\$($Proj)"){
        cd $Proj
        cd $Proj
        $stay=$false
    }
}While($stay)
if($AngCreate -eq 'y'){
    if(Test-Path "$($pwd)\$($Ang)"){
        echo "Angular project $($Ang) already created"
    }else{
        echo "Creating Angular Project"
        ng new $Ang
    }
}
if(Test-Path $pwd"\modules"){
    echo "Modules already created"
}else{
    #New-Item -ItemType Directory -Force -Path $pwd"\modules"
    git clone https://github.com/wfpena/modules.git
    cd modules
    Remove-Item .\.git -Force -Recurse
}
#deactivate
cd..
cd..
cd..