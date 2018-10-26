class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def capture
  	captured_pokemon = Pokemon.find_by(id: params[:id])
    captured_pokemon.trainer = current_trainer
    captured_pokemon.save
    redirect_to root_path
  end

  def damage
  	damaged_pokemon = Pokemon.find_by(id: params[:id])
  	damaged_pokemon.health -= 10
  	damaged_pokemon.save
  	if damaged_pokemon.health <= 0
  		damaged_pokemon.destroy
  	end
  	redirect_to trainer_path(damaged_pokemon.trainer)
  end

  def new
  	@pokemon = Pokemon.new
  end

  def create
  	new_pokemon = Pokemon.create(name: params[:name],level: 1,ndex: params[:ndex],health: 100)
  	new_pokemon.update!(submit_params)
  end

  def submit_params
      params.permit(:name, :ndex)
  end

end
