
=head1 LICENSE

Copyright [1999-2014] EMBL-European Bioinformatics Institute

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

=pod

=head1 NAME

Bio::EnsEMBL::MetaData::BaseInfo

=head1 AUTHOR

Dan Staines

=cut

use strict;
use warnings;

package Bio::EnsEMBL::MetaData::BaseInfo;
use Bio::EnsEMBL::Utils::Argument qw(rearrange);

=head1 CONSTRUCTOR
=head2 new
  

  Example    : $info = Bio::EnsEMBL::MetaData::GenomeInfo->new(...);
  Description: Creates a new info object
  Returntype : Bio::EnsEMBL::MetaData::GenomeInfo
  Exceptions : none
  Caller     : internal
  Status     : Stable

=cut

sub new {
	my ( $proto, @args ) = @_;
	my $class = ref($proto) || $proto;
	my $self = bless( {}, $class );
	( $self->{dbID}, $self->{adaptor} ) =
	  rearrange( [ 'DBID', 'ADAPTOR' ], @args );
	return $self;
}

=head1

=head2 to_hash
  Description: Render object as plain hash suitable for export as JSON/XML
  Argument   : (optional) if set to 1, force expansion of children
  Returntype : Hashref
  Exceptions : none
  Caller     : general
  Status     : Stable
=cut

sub to_hash {
	my ( $in, $keen ) = @_;
	my $out;
	my $type = ref $in;
	if ( defined $keen &&
		 $keen == 1 &&
		 $type =~ m/Bio::EnsEMBL::MetaData::[A-z]+Info/ )
	{
		$in->_preload();
	}
	if ( $type eq 'ARRAY' ) {
		$out = [];
		for my $item ( @{$in} ) {
			push @{$out}, to_hash( $item, $keen );
		}
	}
	elsif ( $type eq 'HASH' || $type eq 'Bio::EnsEMBL::MetaData::GenomeInfo' ) {
		$out = {};
		while ( my ( $key, $val ) = each %$in ) {
			if ( $key ne 'dbID' && $key ne 'adaptor' && $key ne 'logger' ) {

# deal with keys starting with numbers, which are not valid element names in XML
				if ( $key =~ m/^[0-9].*/ ) {
					$key = '_' . $key;
				}
				$out->{$key} = to_hash( $val, $keen );
			}

		}
	}
	elsif ( $type =~ m/Bio::EnsEMBL::MetaData::[A-z]+Info/ ) {
		$out = $in->to_hash($keen);
	}
	else {
		$out = $in;
	}
	if ( defined $keen &&
		 $keen == 1 &&
		 $type =~ m/Bio::EnsEMBL::MetaData::[A-z]+Info/ )
	{
		$in->_preload();
	}
	return $out;
} ## end sub to_hash

=head1 INTERNAL METHODS
=head2 count_hash_values
  Description: Sums values found in hash
  Arg		 : hashref
  Returntype : integer
  Exceptions : none
  Caller     : internal
  Status     : Stable
=cut

sub count_hash_values {
	my ( $self, $hash ) = @_;
	my $tot = 0;
	if ( defined $hash ) {
		for my $v ( values %{$hash} ) {
			$tot += $v;
		}
	}
	return $tot;
}

=head2 count_hash_lengths
  Description: Sums sizes of arrays found in hash as values
  Arg		 : hashref
  Returntype : integer
  Exceptions : none
  Caller     : internal
  Status     : Stable
=cut

sub count_hash_lengths {
	my ( $self, $hash ) = @_;
	my $tot = 0;
	if ( defined $hash ) {
		for my $v ( values %{$hash} ) {
			$tot += scalar(@$v);
		}
	}
	return $tot;
}

=head2 dbID
  Arg        : (optional) dbID to set set
  Description: Gets/sets internal genome_id used as database primary key
  Returntype : dbID string
  Exceptions : none
  Caller     : Bio::EnsEMBL::MetaData::DBSQL::GenomeInfoAdaptor
  Status     : Stable
=cut

sub dbID {
	my ( $self, $id ) = @_;
	$self->{dbID} = $id if ( defined $id );
	return $self->{dbID};
}

=head2 adaptor
  Arg        : (optional) adaptor to set set
  Description: Gets/sets GenomeInfoAdaptor
  Returntype : Bio::EnsEMBL::MetaData::DBSQL::GenomeInfoAdaptor
  Exceptions : none
  Caller     : Internal
  Status     : Stable
=cut

sub adaptor {
	my ( $self, $adaptor ) = @_;
	$self->{adaptor} = $adaptor if ( defined $adaptor );
	return $self->{adaptor};
}

=head2 _preload
  Description: Ensure all children are loaded (used for hash transformation)
  Returntype : none
  Exceptions : none
  Caller     : Internal
  Status     : Stable
=cut

sub _preload {
	my ($self) = @_;
	return;
}

=head2 _preload
  Description: Remove all children (used after hash transformation to ensure object is minimised)
  Returntype : none
  Exceptions : none
  Caller     : dump_metadata.pl
  Status     : Stable
=cut

sub _unload {
	my ($self) = @_;
	return;
}

1;