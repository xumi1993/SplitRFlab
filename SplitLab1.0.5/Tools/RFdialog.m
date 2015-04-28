function RFdialog

global config

mpos =get(0,'PointerLocation');
figpos = [mpos(1)-50 mpos(2)-50 200 200];
fig = figure('WindowStyle','modal','Position',figpos,'NumberTitle','off','Name','RF Parameter','Toolbar','None','menubar','none');

uicontrol('Parent',fig,'Units','pixel',...
    'Style','text',...
    'Position',[15 158 100 20],...
    'String', 'RF format:',...
    'HorizontalAlignment','Left');

RF1 = uicontrol('Parent',fig ,'Units','pixel',...
    'Style','PopupMenu',...
    'BackgroundColor','w',...
    'Position',[90 160 100 20],...
    'String', {'*.sac','*.dat'},...
    'Value',config.rfformat,...
    'Callback','config.rfformat=get(gcbo,''Value'');if config.rfformat == 1;config.issac=1;else;config.issac=0;end;');

uicontrol('Parent',fig,'Units','pixel',...
    'Style','text',...
    'Position',[15 118 100 20],...
    'String', 'RF method:',...
    'HorizontalAlignment','Left');

RF2 = uicontrol('Parent',fig,'Units','pixel',...
    'Style','PopupMenu',...
    'BackgroundColor','w',...
    'Position',[90 120 100 20],...
    'String', {'iter','water'},...
    'Value',config.rfmethod,...
    'Callback','config.rfmethod=get(gcbo,''Value'');if config.rfmethod == 1;config.iter=1;else;config.iter=0;end;');

uicontrol('Parent',fig,'Units','pixel',...
    'Style','text',...
    'Position',[15 78 100 20],...
    'String', 'Noise gate:',...
    'HorizontalAlignment','Left');

RF3 = uicontrol('Parent',fig ,'Units','pixel',...
    'Style','Edit',...
    'BackgroundColor','w',...
    'Position',[95 80 35 20],...
    'ToolTipString','Noise gate',...
    'String', config.snrgate,...
    'Callback', 'config.snrgate=str2num(get(gcbo,''String''));');

uicontrol('Parent',fig,'Units','pixel',...
    'Style','text',...
    'Position',[140 78 100 20],...
    'String', 'dB',...
    'HorizontalAlignment','Left');

uicontrol('Units','pixel', 'Style','pushbutton','Parent',fig,...
    'Position',[150 10 45 25], 'String', 'OK',...
    'callback',' close(gcbf);')

waitfor(fig)