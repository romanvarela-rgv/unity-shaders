// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Ej4"
{
	Properties
	{
		_LineaSpeed("LineaSpeed", Float) = 0
		_Frecuencia("Frecuencia", Float) = 0
		_Radius("Radius", Float) = 0
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			half filler;
		};

		uniform float _Radius;
		uniform float _LineaSpeed;
		uniform float _Frecuencia;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float mulTime2 = _Time.y * _LineaSpeed;
			float temp_output_6_0 = ( mulTime2 * ( _Frecuencia * 6.28318548202515 ) );
			v.vertex.xyz += ( ( ( _Radius * sin( temp_output_6_0 ) ) * float3(0,1,0) ) + ( ( cos( temp_output_6_0 ) * _Radius ) * float3(1,0,0) ) );
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
191.2;73.6;965.2;555;2858.428;201.6361;2.709998;True;False
Node;AmplifyShaderEditor.CommentaryNode;18;-1965.941,198.5531;Inherit;False;623.9867;528.0135;Tiempo y frecuencia;6;4;1;3;2;5;6;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TauNode;4;-1772.354,616.1666;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-1915.941,248.5531;Inherit;False;Property;_LineaSpeed;LineaSpeed;0;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-1855.554,492.1667;Inherit;False;Property;_Frecuencia;Frecuencia;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-1666.754,498.5667;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;2;-1697.154,302.5667;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;20;-1300.981,480.6756;Inherit;False;845.5118;531.2341;Calculo de Coseno;5;8;15;16;17;14;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-1504.354,361.7667;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;19;-1300.206,-37.09548;Inherit;False;770.9059;487.6014;Calculo de Seno;5;9;7;11;12;13;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-1250.206,51.83347;Inherit;False;Property;_Radius;Radius;2;0;Create;True;0;0;0;False;0;False;0;1.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;7;-1214.383,340.106;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CosOpNode;8;-1250.981,530.6757;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;11;-966.0999,173.7047;Inherit;False;Constant;_Vector0;Vector 0;0;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-893.3003,12.90452;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-1058.631,639.6031;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;16;-1068.221,826.3099;Inherit;False;Constant;_Vector1;Vector 1;0;0;Create;True;0;0;0;False;0;False;1,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-838.3001,674.8991;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-691.7003,18.50454;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-607.8693,544.1933;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-131.778,375.3678;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Ej4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;3;0
WireConnection;5;1;4;0
WireConnection;2;0;1;0
WireConnection;6;0;2;0
WireConnection;6;1;5;0
WireConnection;7;0;6;0
WireConnection;8;0;6;0
WireConnection;12;0;9;0
WireConnection;12;1;7;0
WireConnection;15;0;8;0
WireConnection;15;1;9;0
WireConnection;17;0;15;0
WireConnection;17;1;16;0
WireConnection;13;0;12;0
WireConnection;13;1;11;0
WireConnection;14;0;13;0
WireConnection;14;1;17;0
WireConnection;0;11;14;0
ASEEND*/
//CHKSM=96F001355C681496EA807B0864755A0A5FC5B130