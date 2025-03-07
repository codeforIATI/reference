(function () {

    //Alias $ safely inside the closure
    var $ = jQuery;

    //Don't declare as var IatiJS so it goes into the global scope
    IatiJS = {};


    IatiJS.Utilities = {

        equaliseHeight:function ($columns) {
            var tallestcolumn = 0;
            /*columns = $(selector);*/
            $columns.each(function () {
                currentHeight = $(this).height();
                if (currentHeight > tallestcolumn) {
                    tallestcolumn = currentHeight;
                }
            });
            $columns.height(tallestcolumn);
        },

        isInteger:function (value) {
            if ((parseFloat(value) == parseInt(value)) && !isNaN(value)) {
                return true;
            }
            return false;
        }
    },


    IatiJS.Form = {


        placeHolderSupport : function(formSelector){

            var $form = $(formSelector);
            if( $form.length ){

                var $placeholders = $form.find('input[placeholder]');
                $placeholders.each(function(){
                    $(this).addClass('light');
                    var searchPlaceHolder = $(this).attr('placeholder');

                    $(this).val(searchPlaceHolder)
                        .focus(
                        function(){
                            if( this.value == searchPlaceHolder ){
                                this.value='';
                                $(this).removeClass('light');
                            }
                        }).blur(function(){
                            if( this.value == '' ){
                                $(this).val(searchPlaceHolder).addClass('light');
                            }
                        }
                    );

                });
            }

        }

    },


    IatiJS.FileInfo = {

        content:undefined,
        links:undefined,

        linkIcons:function ($content) {
            IatiJS.FileInfo.content = $content;
            IatiJS.FileInfo.links = $content.find('a');
            var links = IatiJS.FileInfo.links;

            links.each(function () {
                IatiJS.FileInfo.linkIcon($(this));
            });

        },

        linkIcon:function ($link) {
            var url = $link[0].href;
            var extension = url.split('.').pop();
            console.log("Bagdfhd" + url);
            $link.addClass('filetype ' + extension);
            var linkText = $link.text();
            $link.before("<span class='dark'>" + linkText + "</span><br/>");
            $link.text("Download");
        }

    },


    IatiJS.UI = {

        collapseable:function ($container, collapsed) {

            var $collapseables = $container.find('div.collapseable');

            if (collapsed == true) {
                $collapseables.each(function () {
                    $(this).hide();
                });
            }

            $container.find('h2').each(function () {
                $(this).on("click", function () {
                    $(this).next('.collapseable').toggle(500);
                    $(this).find('.toggle').first().toggleClass('open closed');
                });
                var $toggle = $('<span class="toggle closed"></span>');
                $(this).prepend($toggle);
            });

        }

    },

    IatiJS.Navigation = {

        treeMenu : function( treeContainer ){

            var $treeContainer = $( treeContainer );
            var $tree = $treeContainer.find('ul').first();

            var toggleSubMenus = function(ele){
                $(ele).toggle();
                var toggle = $(ele).siblings('span.toggle');
                $(toggle).toggleClass('open');
            };

            //Paint root
            $tree.addClass('pages-root');
            //Find all pages with children and paint them
            $treeContainer.find('ul.children').closest('li').addClass('page-has-children');
            //Paint levels
            $treeContainer.find('ul.pages-root > li').addClass('level-0');


            //Add toggles to all li with submenus
            $tree.find('ul').each(function(i){
                if (!$(this).hasClass('simple')) {
                    var $toggle = $('<span class="toggle"></span>');
                    $(this).parent().prepend($toggle);
                    $(this).parent().addClass('page-has-children');
                }
            });

            //Setup the initial menu state...
            $treeContainer.find('ul').hide();
            var $currentPage = $($('a.current').parent());
            var $thisSubMenu = $currentPage.find('ul').first();
            $currentPage.parents('ul').add($thisSubMenu).each( function(){
                toggleSubMenus(this);
            });

            // Event handlers for the toggles
            $treeContainer.find('ul').on('click', 'span.toggle' , function(){
                //Open close the child uls
                $(this).parent().find('ul').first().toggle().toggleClass('open');
                //change toggle images according to state..
                $(this).toggleClass('open');
                return false;
            });


        }

    }


})();
