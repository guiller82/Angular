import {Recipe} from './recipe.model';
import { EventEmitter } from '@angular/core';

export class RecipeService {

recipeSelected = new EventEmitter<Recipe>();

private recipes: Recipe[] = [
new Recipe('Test Recipe', 'This is a simply test', 'https://www.inspiredtaste.net/wp-content/uploads/2013/01/Roasted-Pepper-Pinwheel-Pastry-Recipe-2-1200.jpg'),
new Recipe('Test2 Recipe', 'This is a simply test', 'https://www.inspiredtaste.net/wp-content/uploads/2013/01/Roasted-Pepper-Pinwheel-Pastry-Recipe-2-1200.jpg' )];

getRecipes() {
    console.log('eee');
    return this.recipes.slice();
}

}
