FROM microsoft/aspnetcore-build as builder

WORKDIR /src

COPY Mvc-OpenShift.csproj .

RUN dotnet restore

COPY . .

RUN dotnet publish -c Release -o /build

FROM microsoft/aspnetcore

WORKDIR /app

COPY --from=builder /build .

ENTRYPOINT [ "dotnet", "Mvc-OpenShift.dll" ]


