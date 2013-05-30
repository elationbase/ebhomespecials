{*
*  * 2007-2012 PrestaShop
*  ************************************************************************************************************
*  * DISCLAIMER
*  ************************************************************************************************************
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 6594 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*  ************************************************************************************************************
*  * ELATION LIQUID THEME
*  * (d) elation3ase theme development
*  * (c) 2012 Elation Base, LLC
*  * (i) elationbase.com | elationbase@gmail.com
*  * See theme's licence agreement at the theme root folder (licence.txt)
*  ************************************************************************************************************
*  * (i) Do not edit this file if you wish to upgrade PrestaShop or this Theme to newer versions in the future. 
*  ************************************************************************************************************
*}

<!-- MODULE Block specials -->
<article id="eb-product-list" class="clearfix">
	<h4 class="title_block"><a href="{$link->getPageLink('prices-drop')}" title="{l s='Specials' mod='ebhomespecials'}">{l s='Specials' mod='ebhomespecials'}</a></h4>

{if $special}
    <ul id="product_list">
        <li class="ajax_block_product clearfix">
        	<section class="clearfix">
                <div class="eb-product-image">
                	<a href="{$special.link}"><img src="{$link->getImageLink($special.link_rewrite, $special.id_image, 'home_liquid')}" alt="{$special.name|escape:html:'UTF-8'}" /></a>
                </div>
                {if !$PS_CATALOG_MODE}
                    {if $special.specific_prices}
                        {assign var='specific_prices' value=$special.specific_prices}
                        {if $specific_prices.reduction_type == 'percentage' && ($specific_prices.from == $specific_prices.to OR ($smarty.now|date_format:'%Y-%m-%d %H:%M:%S' <= $specific_prices.to && $smarty.now|date_format:'%Y-%m-%d %H:%M:%S' >= $specific_prices.from))}
                            <span class="reduction"><span>-{$specific_prices.reduction*100|floatval}%</span></span>
                        {/if}
                    {/if}
                {/if}
                <div class="eb-product-links">
                    {if ($special.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $special.available_for_order && !isset($restricted_country_mode) && $special.minimal_quantity <= 1 && $product.customizable != 2}
                        {if ($special.allow_oosp || $special.quantity > 0)}
                            <a class="ajax_add_to_cart_button" rel="ajax_id_product_{$special.id_product|intval}" href="{$link->getPageLink('cart.php')}?add&amp;id_product={$special.id_product|intval}{if isset($static_token)}&amp;token={$static_token}{/if}" title="{l s='Add to cart' mod='ebhomespecials'}">{l s='Add to cart' mod='ebhomespecials'}</a>
                        {else}
                            <span class="add-disable" title="{l s='Out of stock' mod='ebhomespecials'}"></span>
                        {/if}
                    {else}
                        <a class="eb-view-item" href="{$product.link|escape:'htmlall':'UTF-8'}" title="{l s='View Product' mod='ebhomespecials'}">{l s='View Product' mod='ebhomespecials'}</a>
                    {/if}
                </div>
                <div class="eb-product-text clearfix">
                	<h1><a href="{$special.link}">{$special.name|truncate:26:'...'|escape:html:'UTF-8'}</a></h1>
                    <div class="eb-product-desc clearfix">
                    	<p>{$product.description_short|truncate:360:'...'|strip_tags:'UTF-8'}</p>
                    </div>
                    {if !$PS_CATALOG_MODE}
                    <div class="eb-product-price clearfix">
                        {if !$priceDisplay}<span>{displayWtPrice p=$special.price_without_reduction}{else}{displayWtPrice p=$priceWithoutReduction_tax_excl}</span>{/if}
                        {if !$priceDisplay}<span>{displayWtPrice p=$special.price}{else}{displayWtPrice p=$special.price_tax_exc}</span>{/if}
                    </div>
                    {/if}
                </div>
            </section>
        </li>
    </ul>
{else}
    <p>{l s='No product specials are available at this time.' mod='ebhomespecials'}</p>
{/if}
</article>
<!-- /MODULE Block specials -->