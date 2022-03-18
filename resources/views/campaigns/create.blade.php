@extends('layouts.app')

@section('content-title', ucwords(__('campaigns.plural')))

@include('models.create', [
  'panel_title' => ucwords(__('campaigns.singular')),
  'resource_route' => 'campaigns',
  'model_variable' => 'campaign',
  'model_class' => \App\Campaign::class,
])
