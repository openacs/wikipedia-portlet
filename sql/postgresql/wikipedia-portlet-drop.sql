
create function inline_1()
returns integer as '
declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  select datasource_id into ds_id
      from portal_datasources
     where name = ''wikipedia_portlet'';

   if not found then
     RAISE EXCEPTION '' No datasource id found '', ds_id;
     ds_id := null;
   end if;

  if ds_id is NOT null then
    perform portal_datasource__delete(ds_id);
  end if;

        -- drop the hooks
        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''wikipedia_portlet'',
               ''GetMyName''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''wikipedia_portlet'',
               ''GetPrettyName''
        );


        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''wikipedia_portlet'',
               ''Link''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''wikipedia_portlet'',
               ''AddSelfToPage''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''wikipedia_portlet'',
               ''Show''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''wikipedia_portlet'',
               ''Edit''
        );

        perform acs_sc_impl_alias__delete (
               ''portal_datasource'',
               ''wikipedia_portlet'',
               ''RemoveSelfFromPage''
        );

        -- Drop the binding
        perform acs_sc_binding__delete (
            ''portal_datasource'',
            ''wikipedia_portlet''
        );

        -- drop the impl
        perform acs_sc_impl__delete (
                ''portal_datasource'',
                ''wikipedia_portlet''
        );
        
        return 0;
end;' language 'plpgsql';

select inline_1();
drop function inline_1();

