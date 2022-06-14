using GeneteaApi.Context;
using GeneteaApi.Contracts;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddSingleton<DapperContext>();
builder.Services.AddScoped<ITeaRepository, TeaRepository>();
builder.Services.AddScoped<IBasketRepository, BasketRepository>();
builder.Services.AddScoped<IBasketContentRepository, BasketContentRepository>();
builder.Services.AddControllers();
builder.Services.AddSingleton<DapperContext>();

// Add services to the container.
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
