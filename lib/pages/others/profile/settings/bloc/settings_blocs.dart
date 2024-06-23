import 'package:elearning_app_bloc/pages/others/profile/settings/bloc/setting_states.dart';
import 'package:elearning_app_bloc/pages/others/profile/settings/bloc/settings_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingStates> {
  SettingsBlocs():super(SettingStates()){
    on<TriggeerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingsEvents event, Emitter<SettingStates>emit){
    emit(const SettingStates());
  }
  
}