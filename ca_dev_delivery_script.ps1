# Executar os comandos .NET em sequência
$commands = @(
    "dotnet new sln -n DevDelivery",
    "dotnet new classlib -n DevDelivery.Domain -o DevDelivery.Domain",
    "dotnet new classlib -n DevDelivery.Application -o DevDelivery.Application",
    "dotnet new classlib -n DevDelivery.Infrastructure -o DevDelivery.Infrastructure",
    "dotnet new webapi -n DevDelivery.Presentation -o DevDelivery.Presentation",
    "dotnet sln add DevDelivery.Domain/DevDelivery.Domain.csproj",
    "dotnet sln add DevDelivery.Application/DevDelivery.Application.csproj",
    "dotnet sln add DevDelivery.Infrastructure/DevDelivery.Infrastructure.csproj",
    "dotnet sln add DevDelivery.Presentation/DevDelivery.Presentation.csproj",
    "dotnet add DevDelivery.Application/DevDelivery.Application.csproj reference DevDelivery.Domain/DevDelivery.Domain.csproj",
    "dotnet add DevDelivery.Infrastructure/DevDelivery.Infrastructure.csproj reference DevDelivery.Application/DevDelivery.Application.csproj",
    "dotnet add DevDelivery.Presentation/DevDelivery.Presentation.csproj reference DevDelivery.Application/DevDelivery.Application.csproj",
    "dotnet add DevDelivery.Presentation/DevDelivery.Presentation.csproj reference DevDelivery.Infrastructure/DevDelivery.Infrastructure.csproj"
)

foreach ($command in $commands) {
    Write-Host "Executando comando: $dotnetPath $command"
    Invoke-Expression -Command "$command"
}