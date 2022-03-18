@extends('layouts.app')

@section('content-title', ucwords(__('campaigns.plural')))

@include('models.show', [
  'panel_title' => ucwords(__('campaigns.singular')),
  'resource_route' => 'campaigns',
  'model_variable' => 'campaign',
  'model' => $campaign
])
