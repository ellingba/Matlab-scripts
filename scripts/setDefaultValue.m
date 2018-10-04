function setDefaultValue(argName, defaultValue)
% Initialise a missing or empty value in the caller function.
% 
% SETDEFAULTVALUE(ARGNAME, DEFAULTVALUE) checks to see if the
% argument named ARGNAME of the caller function is
% missing or empty, and if so, assigns it the value DEFAULTVALUE.
% This function does not check boundarie conditions!


if ~evalin('caller', ['exist(''' argName ''', ''var'')']) || ...
      isempty(evalin('caller', argName))
   assignin('caller', argName, defaultValue);
end

end