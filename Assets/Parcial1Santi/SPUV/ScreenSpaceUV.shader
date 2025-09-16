// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ScreenSpaceUV"
{
	Properties
	{
		_MainTexture("MainTexture", 2D) = "white" {}
		_Noise("Noise", 2D) = "white" {}
		_Float0("Float 0", Float) = 100
		_Vector0("Vector 0", Vector) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 screenPos;
			float2 uv_texcoord;
		};

		uniform sampler2D _MainTexture;
		uniform float2 _Vector0;
		uniform sampler2D _Noise;
		uniform float4 _Noise_ST;
		uniform float _Float0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 uv_Noise = i.uv_texcoord * _Noise_ST.xy + _Noise_ST.zw;
			float4 smoothstepResult21 = smoothstep( float4( 0,0,0,0 ) , float4( 0,1,0.2326398,0 ) , ( tex2D( _Noise, uv_Noise ) + _Float0 ));
			float4 lerpResult7 = lerp( float4( 0,0,0,0 ) , tex2D( _MainTexture, (( ase_screenPosNorm * float4( _Vector0, 0.0 , 0.0 ) )).xyzw.xy ) , smoothstepResult21);
			o.Albedo = lerpResult7.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
267;73;1207;601;1894.265;297.9776;1.475812;True;False
Node;AmplifyShaderEditor.ScreenPosInputsNode;1;-1346.328,28.67035;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;18;-1299.929,212.9031;Float;False;Property;_Vector0;Vector 0;3;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1043.929,101.9031;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-986.0966,589.0446;Inherit;False;Property;_Float0;Float 0;2;0;Create;True;0;0;0;False;0;False;100;100;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;8;-1209.697,335.5447;Inherit;True;Property;_Noise;Noise;1;0;Create;True;0;0;0;False;0;False;-1;e24b2c680edaa90458d31f11544d79ca;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;6;-908.6868,97.4423;Inherit;False;True;True;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-813.9487,364.1432;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;21;-550.9291,348.9031;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,1,0.2326398,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;5;-586.9959,97.64431;Inherit;True;Property;_MainTexture;MainTexture;0;0;Create;True;0;0;0;False;0;False;-1;dc93c4263d21240408beaecaed326cf2;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;11;-311.1966,535.8447;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;7;-195.0966,112.6443;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.CeilOpNode;12;-116.1964,538.9447;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ScreenSpaceUV;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;19;0;1;0
WireConnection;19;1;18;0
WireConnection;6;0;19;0
WireConnection;14;0;8;0
WireConnection;14;1;10;0
WireConnection;21;0;14;0
WireConnection;5;1;6;0
WireConnection;7;1;5;0
WireConnection;7;2;21;0
WireConnection;12;0;11;0
WireConnection;0;0;7;0
ASEEND*/
//CHKSM=EA03CC7421942A2F51BFEB6355725AF99D4B8145