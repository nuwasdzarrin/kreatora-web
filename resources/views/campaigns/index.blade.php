@extends('layouts.app')

@section('content-title', ucwords(__('campaigns.plural')))

@include('models.index', [
  'col_class' => 'col-md-8 col-md-offset-2 offset-md-2',
  'panel_title' => ucwords(__('campaigns.plural')),
  'resource_route' => 'campaigns',
  'model_variable' => 'campaign',
  'model_class' => \App\Campaign::class,
  'models' => $campaigns,
  'action_buttons_view' => 'generator::components.models.index.action_buttons',
])
