function backgroundContrastsTable = backgroundContrastsFromName(participant,sessionName)
% Extract results from session specified by name
%   
% Syntax:
%   resultsTable = backgroundContrastsFromName(participant,sessionName)
%
% Description:
%    From a session specified by participant and session name, extract the
%    nominal and validated LMS threshold contrast.
%   
% Inputs:
%    participant  - scalar string / char-array specified participant
%    sessionName  - scalar string / char-array specifying session. Will be
%                   partially matched.
%
% Outputs:
%    resultsTable - table(), with variables 'name', 'pedestalPresent',
%                   'thresholdContrastNominal',
%                   'thresholdContrastValidated'

materials = MeLMSens_SteadyAdapt.dataManagement.loadSessionMaterialsFromName(participant, sessionName);
backgroundContrastsTable = MeLMSens_SteadyAdapt.splatter.backgroundContrastsFromMaterials(materials);

% Prepend participant, session identified
backgroundContrastsTable = addvarString(backgroundContrastsTable,[string(participant) string(sessionName)],...
                        'VariableNames',{'participant','session'}); % add participant,session identifier
backgroundContrastsTable = backgroundContrastsTable(:,[end-1:end, 1:end-2]); % move to front
end