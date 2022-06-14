##############################################################################
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##############################################################################

testEnvSetup:

testEnvTeardown:


ifneq (,$(findstring JITAAS,$(TEST_FLAG)))
testEnvSetup:
	$(TEST_JDK_HOME)/bin/jitserver &

testEnvTeardown:
	pkill -9 -xf "$(TEST_JDK_HOME)/bin/jitserver"; true

RESERVED_OPTIONS += -XX:+UseJITServer
endif

export TR_silentEnv=1
export TR_enableBreakOnDFSet=1
export TR_DisableBatchClear=1
