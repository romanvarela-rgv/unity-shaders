// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ToonWater"
{
	Properties
	{
		_FlowMap("FlowMap", 2D) = "white" {}
		_Int0("Int 0", Int) = 1
		_Texture0("Texture 0", 2D) = "white" {}
		_Float0("Float 0", Range( 0 , 1)) = 0.05643113
		_PanDir("PanDir", Vector) = (0.03,0.8,0,0)
		_PanSpeed("PanSpeed", Int) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Texture0;
		uniform float2 _PanDir;
		uniform int _PanSpeed;
		uniform int _Int0;
		uniform sampler2D _FlowMap;
		uniform float4 _FlowMap_ST;
		uniform float _Float0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 temp_cast_0 = _Int0;
			float2 uv_TexCoord8 = i.uv_texcoord * temp_cast_0;
			float2 uv_FlowMap = i.uv_texcoord * _FlowMap_ST.xy + _FlowMap_ST.zw;
			float4 tex2DNode2 = tex2D( _FlowMap, uv_FlowMap );
			float4 appendResult4 = (float4(tex2DNode2.r , tex2DNode2.g , 0.0 , 0.0));
			float4 lerpResult7 = lerp( float4( uv_TexCoord8, 0.0 , 0.0 ) , ( appendResult4 + float4( uv_TexCoord8, 0.0 , 0.0 ) ) , _Float0);
			float2 panner11 = ( 1.0 * _Time.y * ( _PanDir * _PanSpeed ) + lerpResult7.xy);
			o.Albedo = tex2D( _Texture0, panner11 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
2545;73;910;918;245.6837;28.04288;1;False;False
Node;AmplifyShaderEditor.SamplerNode;2;-390.908,-136.1676;Inherit;True;Property;_FlowMap;FlowMap;0;0;Create;True;0;0;0;False;0;False;-1;4a59633046c8a5546b3ffa2707cd5ad6;4a59633046c8a5546b3ffa2707cd5ad6;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.IntNode;9;-255.2941,221.7527;Inherit;False;Property;_Int0;Int 0;1;0;Create;True;0;0;0;False;0;False;1;0;False;0;1;INT;0
Node;AmplifyShaderEditor.DynamicAppendNode;4;-52.70807,-97.16754;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;8;-64.32686,182.9761;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-62.7998,322.5187;Inherit;False;Property;_Float0;Float 0;3;0;Create;True;0;0;0;False;0;False;0.05643113;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;15;-4.844198,699.4252;Inherit;False;Property;_PanSpeed;PanSpeed;5;0;Create;True;0;0;0;False;0;False;1;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;144.2825,-11.46175;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.Vector2Node;14;-27.69761,551.2856;Inherit;False;Property;_PanDir;PanDir;4;0;Create;True;0;0;0;False;0;False;0.03,0.8;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.LerpOp;7;308.8922,-1.167892;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;218.3559,465.0255;Inherit;False;2;2;0;FLOAT2;0,0;False;1;INT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;10;444.092,-222.768;Inherit;True;Property;_Texture0;Texture 0;2;0;Create;True;0;0;0;False;0;False;6384dbaa8eca7414f8f4c423799d422b;6384dbaa8eca7414f8f4c423799d422b;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.PannerNode;11;497.6415,102.6028;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;3;713.892,-22.56761;Inherit;True;Property;_susanapeakeseatexture;susana-peake-sea-texture;1;0;Create;True;0;0;0;False;0;False;-1;6384dbaa8eca7414f8f4c423799d422b;6384dbaa8eca7414f8f4c423799d422b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1085.6,-32.00006;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ToonWater;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;0;2;1
WireConnection;4;1;2;2
WireConnection;8;0;9;0
WireConnection;5;0;4;0
WireConnection;5;1;8;0
WireConnection;7;0;8;0
WireConnection;7;1;5;0
WireConnection;7;2;12;0
WireConnection;13;0;14;0
WireConnection;13;1;15;0
WireConnection;11;0;7;0
WireConnection;11;2;13;0
WireConnection;3;0;10;0
WireConnection;3;1;11;0
WireConnection;0;0;3;0
ASEEND*/
//CHKSM=9FBFB93DA748550400E4777F4AAE6181EAEC57B0