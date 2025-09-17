// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DepthFadeWATER"
{
	Properties
	{
		_Deep("Deep", Color) = (0,0,0,0)
		_Seashore("Seashore", Color) = (1,1,1,0)
		_Depth("Depth", Float) = 0
		_Falloff(" Falloff", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Transparent+0" }
		Cull Back
		CGPROGRAM
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf StandardSpecular keepalpha 
		struct Input
		{
			float4 screenPos;
		};

		uniform float4 _Deep;
		uniform float4 _Seashore;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _Depth;
		uniform float _Falloff;

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			half eyeDepth1 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			half temp_output_94_0 = saturate( pow( ( abs( ( eyeDepth1 - ase_screenPos.w ) ) + _Depth ) , _Falloff ) );
			half4 lerpResult13 = lerp( _Deep , _Seashore , temp_output_94_0);
			half4 lerpResult117 = lerp( lerpResult13 , float4(1,1,1,0) , float4( 0,0,0,0 ));
			half4 lerpResult93 = lerp( lerpResult117 , float4( 0,0,0,0 ) , temp_output_94_0);
			o.Albedo = lerpResult93.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
2545;73;910;918;1454.506;1619.352;2.488406;False;False
Node;AmplifyShaderEditor.ScreenPosInputsNode;166;-1283.989,-821.2439;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;1;-1054.845,-800.0832;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;2;-1266.845,-653.5831;Float;False;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3;-847.4445,-754.7828;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;89;-662.2486,-756.9668;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-593.9238,-630.1578;Float;False;Property;_Depth;Depth;2;0;Create;True;0;0;0;False;0;False;0;1.62;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-417.224,-581.1584;Float;False;Property;_Falloff; Falloff;3;0;Create;True;0;0;0;False;0;False;0;-2.18;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;88;-412.2291,-706.541;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;87;-236.0295,-620.1414;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;11;-116.1235,-840.6585;Float;False;Property;_Seashore;Seashore;1;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0.8088232,0.8088235,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;12;-28.12357,-1029.059;Float;False;Property;_Deep;Deep;0;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0.04310153,0.249998,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;94;-29.72799,-598.9422;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;13;162.6765,-697.8583;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;108;79.12812,-454.4363;Float;False;Constant;_Color0;Color 0;-1;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;117;422.87,-494.4025;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;93;628.5957,-654.8727;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;800.817,-758.1265;Half;False;True;-1;2;ASEMaterialInspector;0;0;StandardSpecular;DepthFadeWATER;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;3;False;-1;False;0;False;-1;0;False;-1;False;0;Translucent;0.5;True;False;0;False;Opaque;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;4;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;1;False;-1;1;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1;0;166;0
WireConnection;3;0;1;0
WireConnection;3;1;2;4
WireConnection;89;0;3;0
WireConnection;88;0;89;0
WireConnection;88;1;6;0
WireConnection;87;0;88;0
WireConnection;87;1;10;0
WireConnection;94;0;87;0
WireConnection;13;0;12;0
WireConnection;13;1;11;0
WireConnection;13;2;94;0
WireConnection;117;0;13;0
WireConnection;117;1;108;0
WireConnection;93;0;117;0
WireConnection;93;2;94;0
WireConnection;0;0;93;0
ASEEND*/
//CHKSM=3979B9831A103E4BE2DA5D5BC589B870127824D1