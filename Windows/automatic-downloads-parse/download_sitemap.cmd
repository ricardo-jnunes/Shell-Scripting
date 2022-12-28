for /L %%N in (0, 1,58) do curl https://www.camicado.com.br/detail%%N.xml --output desktop_product_%%N.xml
