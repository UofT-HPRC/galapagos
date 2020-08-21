<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<!DOCTYPE boost_serialization>
<boost_serialization signature="serialization::archive" version="15">
<syndb class_id="0" tracking_level="0" version="0">
	<userIPLatency>-1</userIPLatency>
	<userIPName></userIPName>
	<cdfg class_id="1" tracking_level="1" version="0" object_id="_0">
		<name>raw_bridge</name>
		<ret_bitwidth>0</ret_bitwidth>
		<ports class_id="2" tracking_level="0" version="0">
			<count>4</count>
			<item_version>0</item_version>
			<item class_id="3" tracking_level="1" version="0" object_id="_1">
				<Value class_id="4" tracking_level="0" version="0">
					<Obj class_id="5" tracking_level="0" version="0">
						<type>1</type>
						<id>1</id>
						<name>to_app_V</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo class_id="6" tracking_level="0" version="0">
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>to_app.V</originalName>
						<rtlName></rtlName>
						<coreName>AXI4Stream</coreName>
					</Obj>
					<bitwidth>89</bitwidth>
				</Value>
				<direction>1</direction>
				<if_type>3</if_type>
				<array_size>0</array_size>
				<bit_vecs class_id="7" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_2">
				<Value>
					<Obj>
						<type>1</type>
						<id>2</id>
						<name>from_raw_V</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>from_raw.V</originalName>
						<rtlName></rtlName>
						<coreName>AXI4Stream</coreName>
					</Obj>
					<bitwidth>73</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>3</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_3">
				<Value>
					<Obj>
						<type>1</type>
						<id>3</id>
						<name>from_app_V</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>from_app.V</originalName>
						<rtlName></rtlName>
						<coreName>AXI4Stream</coreName>
					</Obj>
					<bitwidth>89</bitwidth>
				</Value>
				<direction>0</direction>
				<if_type>3</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
			<item class_id_reference="3" object_id="_4">
				<Value>
					<Obj>
						<type>1</type>
						<id>4</id>
						<name>to_raw_V</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName>to_raw.V</originalName>
						<rtlName></rtlName>
						<coreName>AXI4Stream</coreName>
					</Obj>
					<bitwidth>73</bitwidth>
				</Value>
				<direction>1</direction>
				<if_type>3</if_type>
				<array_size>0</array_size>
				<bit_vecs>
					<count>0</count>
					<item_version>0</item_version>
				</bit_vecs>
			</item>
		</ports>
		<nodes class_id="8" tracking_level="0" version="0">
			<count>3</count>
			<item_version>0</item_version>
			<item class_id="9" tracking_level="1" version="0" object_id="_5">
				<Value>
					<Obj>
						<type>0</type>
						<id>26</id>
						<name></name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<oprand_edges>
					<count>5</count>
					<item_version>0</item_version>
					<item>31</item>
					<item>32</item>
					<item>33</item>
					<item>38</item>
					<item>39</item>
				</oprand_edges>
				<opcode>call</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_delay>0.00</m_delay>
			</item>
			<item class_id_reference="9" object_id="_6">
				<Value>
					<Obj>
						<type>0</type>
						<id>27</id>
						<name></name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<oprand_edges>
					<count>7</count>
					<item_version>0</item_version>
					<item>35</item>
					<item>36</item>
					<item>37</item>
					<item>40</item>
					<item>41</item>
					<item>42</item>
					<item>43</item>
				</oprand_edges>
				<opcode>call</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_delay>0.00</m_delay>
			</item>
			<item class_id_reference="9" object_id="_7">
				<Value>
					<Obj>
						<type>0</type>
						<id>28</id>
						<name></name>
						<fileName>/home/user/galapagos/middleware/hls/network_bridge_raw/src/raw_bridge.cpp</fileName>
						<fileDirectory>/home/user/galapagos/middleware/hls/network_bridge_raw</fileDirectory>
						<lineNumber>187</lineNumber>
						<contextFuncName>raw_bridge</contextFuncName>
						<inlineStackInfo>
							<count>1</count>
							<item_version>0</item_version>
							<item class_id="11" tracking_level="0" version="0">
								<first>/home/user/galapagos/middleware/hls/network_bridge_raw</first>
								<second class_id="12" tracking_level="0" version="0">
									<count>1</count>
									<item_version>0</item_version>
									<item class_id="13" tracking_level="0" version="0">
										<first class_id="14" tracking_level="0" version="0">
											<first>/home/user/galapagos/middleware/hls/network_bridge_raw/src/raw_bridge.cpp</first>
											<second>raw_bridge</second>
										</first>
										<second>187</second>
									</item>
								</second>
							</item>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<oprand_edges>
					<count>0</count>
					<item_version>0</item_version>
				</oprand_edges>
				<opcode>ret</opcode>
				<m_Display>0</m_Display>
				<m_isOnCriticalPath>0</m_isOnCriticalPath>
				<m_delay>0.00</m_delay>
			</item>
		</nodes>
		<consts class_id="15" tracking_level="0" version="0">
			<count>2</count>
			<item_version>0</item_version>
			<item class_id="16" tracking_level="1" version="0" object_id="_8">
				<Value>
					<Obj>
						<type>2</type>
						<id>30</id>
						<name>raw_to_app</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<const_type>6</const_type>
				<content>&lt;constant:raw_to_app&gt;</content>
			</item>
			<item class_id_reference="16" object_id="_9">
				<Value>
					<Obj>
						<type>2</type>
						<id>34</id>
						<name>app_to_raw</name>
						<fileName></fileName>
						<fileDirectory></fileDirectory>
						<lineNumber>0</lineNumber>
						<contextFuncName></contextFuncName>
						<inlineStackInfo>
							<count>0</count>
							<item_version>0</item_version>
						</inlineStackInfo>
						<originalName></originalName>
						<rtlName></rtlName>
						<coreName></coreName>
					</Obj>
					<bitwidth>0</bitwidth>
				</Value>
				<const_type>6</const_type>
				<content>&lt;constant:app_to_raw&gt;</content>
			</item>
		</consts>
		<blocks class_id="17" tracking_level="0" version="0">
			<count>1</count>
			<item_version>0</item_version>
			<item class_id="18" tracking_level="1" version="0" object_id="_10">
				<Obj>
					<type>3</type>
					<id>29</id>
					<name>raw_bridge</name>
					<fileName></fileName>
					<fileDirectory></fileDirectory>
					<lineNumber>0</lineNumber>
					<contextFuncName></contextFuncName>
					<inlineStackInfo>
						<count>0</count>
						<item_version>0</item_version>
					</inlineStackInfo>
					<originalName></originalName>
					<rtlName></rtlName>
					<coreName></coreName>
				</Obj>
				<node_objs>
					<count>3</count>
					<item_version>0</item_version>
					<item>26</item>
					<item>27</item>
					<item>28</item>
				</node_objs>
			</item>
		</blocks>
		<edges class_id="19" tracking_level="0" version="0">
			<count>12</count>
			<item_version>0</item_version>
			<item class_id="20" tracking_level="1" version="0" object_id="_11">
				<id>31</id>
				<edge_type>1</edge_type>
				<source_obj>30</source_obj>
				<sink_obj>26</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_12">
				<id>32</id>
				<edge_type>1</edge_type>
				<source_obj>2</source_obj>
				<sink_obj>26</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_13">
				<id>33</id>
				<edge_type>1</edge_type>
				<source_obj>1</source_obj>
				<sink_obj>26</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_14">
				<id>35</id>
				<edge_type>1</edge_type>
				<source_obj>34</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_15">
				<id>36</id>
				<edge_type>1</edge_type>
				<source_obj>3</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_16">
				<id>37</id>
				<edge_type>1</edge_type>
				<source_obj>4</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_17">
				<id>38</id>
				<edge_type>1</edge_type>
				<source_obj>5</source_obj>
				<sink_obj>26</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_18">
				<id>39</id>
				<edge_type>1</edge_type>
				<source_obj>6</source_obj>
				<sink_obj>26</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_19">
				<id>40</id>
				<edge_type>1</edge_type>
				<source_obj>7</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_20">
				<id>41</id>
				<edge_type>1</edge_type>
				<source_obj>8</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_21">
				<id>42</id>
				<edge_type>1</edge_type>
				<source_obj>9</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
			<item class_id_reference="20" object_id="_22">
				<id>43</id>
				<edge_type>1</edge_type>
				<source_obj>10</source_obj>
				<sink_obj>27</sink_obj>
				<is_back_edge>0</is_back_edge>
			</item>
		</edges>
	</cdfg>
	<cdfg_regions class_id="21" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="22" tracking_level="1" version="0" object_id="_23">
			<mId>1</mId>
			<mTag>raw_bridge</mTag>
			<mType>0</mType>
			<sub_regions>
				<count>0</count>
				<item_version>0</item_version>
			</sub_regions>
			<basic_blocks>
				<count>1</count>
				<item_version>0</item_version>
				<item>29</item>
			</basic_blocks>
			<mII>-1</mII>
			<mDepth>-1</mDepth>
			<mMinTripCount>-1</mMinTripCount>
			<mMaxTripCount>-1</mMaxTripCount>
			<mMinLatency>1</mMinLatency>
			<mMaxLatency>-1</mMaxLatency>
			<mIsDfPipe>1</mIsDfPipe>
			<mDfPipe class_id="23" tracking_level="1" version="0" object_id="_24">
				<port_list class_id="24" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</port_list>
				<process_list class_id="25" tracking_level="0" version="0">
					<count>2</count>
					<item_version>0</item_version>
					<item class_id="26" tracking_level="1" version="0" object_id="_25">
						<type>0</type>
						<name>raw_to_app_U0</name>
						<ssdmobj_id>26</ssdmobj_id>
						<pins class_id="27" tracking_level="0" version="0">
							<count>4</count>
							<item_version>0</item_version>
							<item class_id="28" tracking_level="1" version="0" object_id="_26">
								<port class_id="29" tracking_level="1" version="0" object_id="_27">
									<name>from_raw_V</name>
									<dir>0</dir>
									<type>0</type>
								</port>
								<inst class_id="30" tracking_level="1" version="0" object_id="_28">
									<type>0</type>
									<name>raw_to_app_U0</name>
									<ssdmobj_id>26</ssdmobj_id>
								</inst>
							</item>
							<item class_id_reference="28" object_id="_29">
								<port class_id_reference="29" object_id="_30">
									<name>to_app_V</name>
									<dir>0</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_28"></inst>
							</item>
							<item class_id_reference="28" object_id="_31">
								<port class_id_reference="29" object_id="_32">
									<name>state_V_1</name>
									<dir>3</dir>
									<type>2</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_28"></inst>
							</item>
							<item class_id_reference="28" object_id="_33">
								<port class_id_reference="29" object_id="_34">
									<name>dest_V</name>
									<dir>3</dir>
									<type>2</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_28"></inst>
							</item>
						</pins>
					</item>
					<item class_id_reference="26" object_id="_35">
						<type>0</type>
						<name>app_to_raw_U0</name>
						<ssdmobj_id>27</ssdmobj_id>
						<pins>
							<count>6</count>
							<item_version>0</item_version>
							<item class_id_reference="28" object_id="_36">
								<port class_id_reference="29" object_id="_37">
									<name>from_app_V</name>
									<dir>0</dir>
									<type>0</type>
								</port>
								<inst class_id_reference="30" object_id="_38">
									<type>0</type>
									<name>app_to_raw_U0</name>
									<ssdmobj_id>27</ssdmobj_id>
								</inst>
							</item>
							<item class_id_reference="28" object_id="_39">
								<port class_id_reference="29" object_id="_40">
									<name>to_raw_V</name>
									<dir>0</dir>
									<type>1</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_38"></inst>
							</item>
							<item class_id_reference="28" object_id="_41">
								<port class_id_reference="29" object_id="_42">
									<name>state_V</name>
									<dir>3</dir>
									<type>2</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_38"></inst>
							</item>
							<item class_id_reference="28" object_id="_43">
								<port class_id_reference="29" object_id="_44">
									<name>app_packet_in_last_V</name>
									<dir>3</dir>
									<type>2</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_38"></inst>
							</item>
							<item class_id_reference="28" object_id="_45">
								<port class_id_reference="29" object_id="_46">
									<name>app_packet_in_data_V</name>
									<dir>3</dir>
									<type>2</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_38"></inst>
							</item>
							<item class_id_reference="28" object_id="_47">
								<port class_id_reference="29" object_id="_48">
									<name>app_packet_in_keep_V</name>
									<dir>3</dir>
									<type>2</type>
								</port>
								<inst class_id_reference="30" object_id_reference="_38"></inst>
							</item>
						</pins>
					</item>
				</process_list>
				<channel_list class_id="31" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</channel_list>
				<net_list class_id="32" tracking_level="0" version="0">
					<count>0</count>
					<item_version>0</item_version>
				</net_list>
			</mDfPipe>
		</item>
	</cdfg_regions>
	<fsm class_id="33" tracking_level="1" version="0" object_id="_49">
		<states class_id="34" tracking_level="0" version="0">
			<count>2</count>
			<item_version>0</item_version>
			<item class_id="35" tracking_level="1" version="0" object_id="_50">
				<id>1</id>
				<operations class_id="36" tracking_level="0" version="0">
					<count>2</count>
					<item_version>0</item_version>
					<item class_id="37" tracking_level="1" version="0" object_id="_51">
						<id>26</id>
						<stage>2</stage>
						<latency>2</latency>
					</item>
					<item class_id_reference="37" object_id="_52">
						<id>27</id>
						<stage>2</stage>
						<latency>2</latency>
					</item>
				</operations>
			</item>
			<item class_id_reference="35" object_id="_53">
				<id>2</id>
				<operations>
					<count>18</count>
					<item_version>0</item_version>
					<item class_id_reference="37" object_id="_54">
						<id>11</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_55">
						<id>12</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_56">
						<id>13</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_57">
						<id>14</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_58">
						<id>15</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_59">
						<id>16</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_60">
						<id>17</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_61">
						<id>18</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_62">
						<id>19</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_63">
						<id>20</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_64">
						<id>21</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_65">
						<id>22</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_66">
						<id>23</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_67">
						<id>24</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_68">
						<id>25</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
					<item class_id_reference="37" object_id="_69">
						<id>26</id>
						<stage>1</stage>
						<latency>2</latency>
					</item>
					<item class_id_reference="37" object_id="_70">
						<id>27</id>
						<stage>1</stage>
						<latency>2</latency>
					</item>
					<item class_id_reference="37" object_id="_71">
						<id>28</id>
						<stage>1</stage>
						<latency>1</latency>
					</item>
				</operations>
			</item>
		</states>
		<transitions class_id="38" tracking_level="0" version="0">
			<count>1</count>
			<item_version>0</item_version>
			<item class_id="39" tracking_level="1" version="0" object_id="_72">
				<inState>1</inState>
				<outState>2</outState>
				<condition class_id="40" tracking_level="0" version="0">
					<id>0</id>
					<sop class_id="41" tracking_level="0" version="0">
						<count>1</count>
						<item_version>0</item_version>
						<item class_id="42" tracking_level="0" version="0">
							<count>0</count>
							<item_version>0</item_version>
						</item>
					</sop>
				</condition>
			</item>
		</transitions>
	</fsm>
	<res class_id="-1"></res>
	<node_label_latency class_id="44" tracking_level="0" version="0">
		<count>3</count>
		<item_version>0</item_version>
		<item class_id="45" tracking_level="0" version="0">
			<first>26</first>
			<second class_id="46" tracking_level="0" version="0">
				<first>0</first>
				<second>1</second>
			</second>
		</item>
		<item>
			<first>27</first>
			<second>
				<first>0</first>
				<second>1</second>
			</second>
		</item>
		<item>
			<first>28</first>
			<second>
				<first>1</first>
				<second>0</second>
			</second>
		</item>
	</node_label_latency>
	<bblk_ent_exit class_id="47" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="48" tracking_level="0" version="0">
			<first>29</first>
			<second class_id="49" tracking_level="0" version="0">
				<first>0</first>
				<second>1</second>
			</second>
		</item>
	</bblk_ent_exit>
	<regions class_id="50" tracking_level="0" version="0">
		<count>1</count>
		<item_version>0</item_version>
		<item class_id="51" tracking_level="1" version="0" object_id="_73">
			<region_name>raw_bridge</region_name>
			<basic_blocks>
				<count>1</count>
				<item_version>0</item_version>
				<item>29</item>
			</basic_blocks>
			<nodes>
				<count>18</count>
				<item_version>0</item_version>
				<item>11</item>
				<item>12</item>
				<item>13</item>
				<item>14</item>
				<item>15</item>
				<item>16</item>
				<item>17</item>
				<item>18</item>
				<item>19</item>
				<item>20</item>
				<item>21</item>
				<item>22</item>
				<item>23</item>
				<item>24</item>
				<item>25</item>
				<item>26</item>
				<item>27</item>
				<item>28</item>
			</nodes>
			<anchor_node>-1</anchor_node>
			<region_type>16</region_type>
			<interval>0</interval>
			<pipe_depth>0</pipe_depth>
		</item>
	</regions>
	<dp_fu_nodes class_id="52" tracking_level="0" version="0">
		<count>2</count>
		<item_version>0</item_version>
		<item class_id="53" tracking_level="0" version="0">
			<first>52</first>
			<second>
				<count>2</count>
				<item_version>0</item_version>
				<item>27</item>
				<item>27</item>
			</second>
		</item>
		<item>
			<first>68</first>
			<second>
				<count>2</count>
				<item_version>0</item_version>
				<item>26</item>
				<item>26</item>
			</second>
		</item>
	</dp_fu_nodes>
	<dp_fu_nodes_expression class_id="55" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_expression>
	<dp_fu_nodes_module>
		<count>2</count>
		<item_version>0</item_version>
		<item class_id="56" tracking_level="0" version="0">
			<first>grp_app_to_raw_fu_52</first>
			<second>
				<count>2</count>
				<item_version>0</item_version>
				<item>27</item>
				<item>27</item>
			</second>
		</item>
		<item>
			<first>grp_raw_to_app_fu_68</first>
			<second>
				<count>2</count>
				<item_version>0</item_version>
				<item>26</item>
				<item>26</item>
			</second>
		</item>
	</dp_fu_nodes_module>
	<dp_fu_nodes_io>
		<count>0</count>
		<item_version>0</item_version>
	</dp_fu_nodes_io>
	<return_ports>
		<count>0</count>
		<item_version>0</item_version>
	</return_ports>
	<dp_mem_port_nodes class_id="57" tracking_level="0" version="0">
		<count>0</count>
		<item_version>0</item_version>
	</dp_mem_port_nodes>
	<dp_reg_nodes>
		<count>0</count>
		<item_version>0</item_version>
	</dp_reg_nodes>
	<dp_regname_nodes>
		<count>0</count>
		<item_version>0</item_version>
	</dp_regname_nodes>
	<dp_reg_phi>
		<count>0</count>
		<item_version>0</item_version>
	</dp_reg_phi>
	<dp_regname_phi>
		<count>0</count>
		<item_version>0</item_version>
	</dp_regname_phi>
	<dp_port_io_nodes class_id="58" tracking_level="0" version="0">
		<count>4</count>
		<item_version>0</item_version>
		<item class_id="59" tracking_level="0" version="0">
			<first>from_app_V</first>
			<second>
				<count>1</count>
				<item_version>0</item_version>
				<item>
					<first>call</first>
					<second>
						<count>1</count>
						<item_version>0</item_version>
						<item>27</item>
					</second>
				</item>
			</second>
		</item>
		<item>
			<first>from_raw_V</first>
			<second>
				<count>1</count>
				<item_version>0</item_version>
				<item>
					<first>call</first>
					<second>
						<count>1</count>
						<item_version>0</item_version>
						<item>26</item>
					</second>
				</item>
			</second>
		</item>
		<item>
			<first>to_app_V</first>
			<second>
				<count>1</count>
				<item_version>0</item_version>
				<item>
					<first>call</first>
					<second>
						<count>1</count>
						<item_version>0</item_version>
						<item>26</item>
					</second>
				</item>
			</second>
		</item>
		<item>
			<first>to_raw_V</first>
			<second>
				<count>1</count>
				<item_version>0</item_version>
				<item>
					<first>call</first>
					<second>
						<count>1</count>
						<item_version>0</item_version>
						<item>27</item>
					</second>
				</item>
			</second>
		</item>
	</dp_port_io_nodes>
	<port2core class_id="60" tracking_level="0" version="0">
		<count>4</count>
		<item_version>0</item_version>
		<item class_id="61" tracking_level="0" version="0">
			<first>1</first>
			<second>AXI4Stream</second>
		</item>
		<item>
			<first>2</first>
			<second>AXI4Stream</second>
		</item>
		<item>
			<first>3</first>
			<second>AXI4Stream</second>
		</item>
		<item>
			<first>4</first>
			<second>AXI4Stream</second>
		</item>
	</port2core>
	<node2core>
		<count>0</count>
		<item_version>0</item_version>
	</node2core>
</syndb>
</boost_serialization>

