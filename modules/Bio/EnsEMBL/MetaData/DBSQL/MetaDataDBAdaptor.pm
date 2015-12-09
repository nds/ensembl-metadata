
=head1 LICENSE

Copyright [2009-2014] EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

=head1 CONTACT

  Please email comments or questions to the public Ensembl
  developers list at <dev@ensembl.org>.

  Questions may also be sent to the Ensembl help desk at
  <helpdesk@ensembl.org>.

=cut

=head1 NAME

Bio::EnsEMBL::DBSQL::TaxonomyDBAdaptor

=head1 DESCRIPTION

Specialised DBAdaptor for connecting to the ncbi_taxonomy MySQL database

=head1 SYNOPSIS

									  
=head DESCRIPTION

A specialised DBAdaptor allowing connection to a metadata database. 
Can be used to retrieve an instance of Bio::EnsEMBL::DBSQL::GenomeInfoAdaptor.

=head1 AUTHOR

dstaines

=head1 MAINTANER

$Author$

=head1 VERSION

$Revision$
=cut		

package Bio::EnsEMBL::MetaData::DBSQL::MetaDataDBAdaptor;

use strict;
use warnings;

use base qw ( Bio::EnsEMBL::DBSQL::DBAdaptor );
use Data::Dumper;

use Bio::EnsEMBL::Utils::Exception qw(throw);

=head1 SUBROUTINES/METHODS

=head2 get_available_adaptors	

	Description	: Retrieve all adaptors supported by this database
	Returns		: Hash of adaptor modules by name
=cut

sub get_available_adaptors {
	return {
		GenomeInfo => 'Bio::EnsEMBL::MetaData::DBSQL::GenomeInfoAdaptor',
		GenomeComparaInfo =>
		  'Bio::EnsEMBL::MetaData::DBSQL::GenomeComparaInfoAdaptor',
		GenomeOrganismInfo =>
		  'Bio::EnsEMBL::MetaData::DBSQL::GenomeOrganismInfoAdaptor',
		GenomeAssemblyInfo =>
		  'Bio::EnsEMBL::MetaData::DBSQL::GenomeAssemblyInfoAdaptor' };
}

1;
