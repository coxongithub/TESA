% pop_tesa_sortcomps()      - sorts ICA components by percentage variance explained by
%                           each time course. Use this to help identify
%                           muscle/decay artefacts using pop_selectcomps.


%                           Note that this was designed primarily for fastica which
%                           does not sort components. Infomax ICA
%                           algorithms already sort components so this will be of limited use. 
% Usage:
%   >>  EEG = tesa_sortcomps( EEG );
%
% Inputs:
%   EEG                 - EEGLAB EEG structure
% 
% Outputs:
%   EEG                 - EEGLAB EEG structure
%
% See also:
%   SAMPLE, EEGLAB 

% Copyright (C) 2015  Nigel Rogasch, Monash University,
% nigel.rogasch@monash.edu
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

 function [EEG com] = pop_tesa_sortcomps( EEG )

com = ''; 

%Check input for ICA weights
if isempty(EEG.icawinv)
	error('No ICA weights. Please run ICA first.');
end

% pop up window
% -------------
if nargin < 2
   
      supergui( 'geomhoriz', { 1 1 1 }, 'uilist', { ...
         { 'style', 'text', 'string', 'Components sorted by time course variance' }, { }, ...
         { 'style', 'pushbutton' , 'string', 'OK', 'callback' 'close(gcbf);' } } );
      
end

%remove data
EEG = tesa_sortcomps( EEG );

% return the string command
com = sprintf('%s = pop_tesa_removedata( %s );', inputname(1), inputname(1));

end