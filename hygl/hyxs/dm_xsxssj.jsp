<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<html>
<head>

<title>��������</title>
</head>
<body bgcolor="#FFFFFF" text="#000000">

<%
String dwbh=(String) session.getAttribute("dwbh");
String yhdlm=(String) session.getAttribute("yhdlm");
String yhjs=(String) session.getAttribute("yhjs");

String dwmc=cf.GB2Uni(request.getParameter("dwmc"));
String xsrq=cf.GB2Uni(request.getParameter("xsrq"));
String hykh=request.getParameter("hykh").trim();
String jyfs=cf.GB2Uni(request.getParameter("jyfs"));
String gmyy=cf.GB2Uni(request.getParameter("gmyy"));
String gmyjbm=cf.GB2Uni(request.getParameter("gmyjbm"));
String []cpxx=request.getParameterValues("cplb");
String []zplb=request.getParameterValues("zplb");

String zkxx=request.getParameter("zkxx");
String zplx=request.getParameter("zplx");
%>

<%	
  Connection conn=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  PreparedStatement ps1=null;
  ResultSet rs1=null;
  String sql=null;
  
  double zkl=100;
  double sjzkl=100;
  double xszkl=100;
  double shjzkl=100;
  double hyzkl=100;
  String zpjj=null;
  String dzpbz="";
  String hyxm=new String();
  String hyjb=new String();
  String fwlx=new String();
  String cpbm=new String();
  String temp_sxj=new String();
  double sxj=0;
  double allsxj=0;
  String pmmc=new String();
  String cplbmc=new String();
  String bkbh=new String();
  String plbm=new String();
  String plmc=new String();
  String cplb=new String();
  double bqj=0;
  double hyj=0;
  double yscbj=0;
	String jldm=null;
	String bsczbm=null;
	String bsflbm=null;
	String jlflbm=null;
	String hyjbbh=null;
	double bqjzkl=0;
	double sxjzkl=0;

 double allbqj=0;
  double tj=0;
  String item=new String();
  int bj=0;
  StringTokenizer temp_zpxx=null;
  StringTokenizer temp_item=null;
  String zpxx=new String();
  String zpbm=new String();
  String zpbm1=new String();
  String zpmc=new String();
  String xslb=new String();
  String ckbm=new String();
  String sfzf="";
  String hybh="";

  String errorcpbm="false";
try{
	conn=cf.getConnection();

	if (yhjs.equals("00"))
	{
		sql="SELECT dwbh,dwmc ";
		sql+=" FROM sq_dwxx";
		sql+=" WHERE dwlx='0'"; 
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			dwbh=rs.getString(1);
			dwmc=rs.getString(2);
		}
	}

	//��ȡ��Ա������Ϣ�Լ���Ա���ۿ���
	if (!hykh.equals(""))
	{
		sql="SELECT hyxm,hy_hyjbb.hyjb,sfzf,hybh,hy_hyxxb.hyjb hyjbbh ";
		sql+=" FROM hy_hyxxb,hy_hyjbb ";
		sql+=" WHERE hy_hyxxb.hykh='"+hykh+"' AND hy_hyxxb.hyjb=hy_hyjbb.hyjbbh(+)"; 
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){
			hyxm=rs.getString(1);
			hyjb=rs.getString(2);
			sfzf=rs.getString(3);
			hybh=rs.getString(4);
			hyjbbh=rs.getString(5);
		}
		else{
			out.println("<BR>�����ڵ�ˮ�ʷ������ţ�");
			return;
		}
		rs.close();
		ps.close();

		if(sfzf.equals("Y")){//�Ƿ�����,0Ϊ���ϣ�1Ϊδ����
			out.println("<BR>ˮ�ʷ��������Ѿ����ϣ�");
			return;
		}
	}

//�ж���Ʒ�Ƿ����
   int fszp=0;//������Ʒ
   if ((zplb!=null)&&(zplb.length>0)){
       fszp=1;
   }
%>
<p align="center">����Ʊ��</p>
<form name="xhd" method="post" action="dm_clxssj.jsp">
  <input type="hidden" name="xslb">
  <input type="hidden" name="yhdlm" size="20" value=<%=yhdlm%>>
  <input type="hidden" name="dwbh" size="20" value=<%=dwbh%>>
  <input type="hidden" name="dwmc" size="20" value=<%=dwmc%>>
  
  <input type="hidden" name="jyfs" size="20" value=<%=jyfs%>>
  <input type="hidden" name="hykh" size="20" value=<%=hykh%>>
  <input type="hidden" name="hybh" size="20" value=<%=hybh%>>
  <input type="hidden" name="xsrq" size="20" value=<%=xsrq%>>
  <input type="hidden" name="gmyy" size="20" value=<%=gmyy%>>
  <input type="hidden" name="gmyjbm" size="20" value=<%=gmyjbm%>>
  <input type="hidden" name="fszp" size="20" value="<%=fszp%>">
  <div align="center">
    <table style="FONT-SIZE: 14px"  width="100%" bgcolor=#999999 border=0 height="5">
      <tr bgcolor=#ffffff> 
        <td  width="20%" align="right">����ص�</td>
        <td  width="30%"> 
          <p align="left"><%=dwmc%></p>
        </td>
        <td  width="22%" align="right">ˮ�ʷ�������</td>
        <td  width="28%"><%=hykh%></td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td width="20%" height="1" align="right">��Ա����</td>
        <td width="30%" height="1"><%=hyxm%></td>
        <td width="22%" height="20" align="right">��Ա���</td>
        <td width="28%" height="1"><%=hybh%></td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td width="20%" height="1" align="right">����Ա�ۿ��� </td>
        <td width="30%" height="1"><%=zkxx%>%</td>
        <td width="22%" height="20" align="right">��Ա����</td>
        <td width="28%" height="1"><%=hyjb%></td>
      </tr>
    </table>
  </div>
   <div align="center">
    <table border="1" width=100% bgcolor="#FFFFFF" height="1" cellspacing="0" cellpadding="1"  style="FONT-SIZE:12">
      <tr bgcolor="#e8e8ff" align="center"> 
        <td width="5%" >���</td>
        <td width="7%"  >��Ʒ����</td>
        <td width="7%"  >��Ʒ���</td>
        <td width="15%"  >��Ʒ����</td>
        <td width="7%"  >��ǩ��</td>
        <td width="7%"  >ʵ����</td>
        <td width="7%"  >��Ա��</td>
        <td width="7%"  >ʵ���ۿ���</td>
        <td width="7%" >�������Ʒ</td>
      </tr>
      <%
   //��ʾ��������
	for(int i=0;i<cpxx.length;i++){
		bj=0;
		bqj=sxj=0;//���ۼۡ���ǩ�ۡ��ؼۡ�ʵ����
		shjzkl=zkl=hyzkl=100;//ʵ���ۿ��ʡ��ۿ��ʡ���Ա�ۿ���
//		out.println(cpxx[i]);
		cpbm=cpxx[i].substring(0,13);//��Ʒ����
		temp_sxj=cpxx[i].substring(14);//ʵ����
		sxj=Double.parseDouble(temp_sxj);
		allsxj+=sxj;
		
		//ȡ���ò�Ʒ��������Ϣ��Ʒ�����ơ�����š�Ʒ�����ơ����ۼۡ���ǩ�ۡ��ؼۡ���Ʒ���Ʒ����룩
		sql="SELECT ckbm,bkbh,xt_plbm.plmc,bqj,cplb,DECODE(zpjj,0,'��',1,'��'),DECODE(cp_cpxx.cplb,'B','�ؽ���','A','��Ƕ��') cplbmc,cp_cpxx.jldm,cp_cpxx.bsczbm,yscbj";
		sql+=" FROM cp_cpxx,xt_plbm ";
		sql+=" WHERE  cp_cpxx.plbm=xt_plbm.plbm";
		sql+=" and cp_cpxx.cpbm='"+cpbm+"' AND szdw='"+dwbh+"' and wlzt='00'";
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){//�Ǳ����Ʒ
			ckbm=rs.getString(1);
			bkbh=rs.getString(2);
			plmc=rs.getString(3);
			bqj=rs.getDouble(4);
			cplb=cf.fillNull(rs.getString(5));
			zpjj=rs.getString(6);
			cplbmc=cf.fillNull(rs.getString(7));
			jldm=rs.getString("jldm");
			bsczbm=rs.getString("bsczbm");
			yscbj=rs.getDouble("yscbj");

			sql="SELECT bsflbm";
			sql+=" FROM xt_bsczbm ";
			sql+=" WHERE  bsczbm='"+bsczbm+"'";
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			if(rs1.next()){
				bsflbm=rs1.getString(1);
			}
			rs1.close();
			ps1.close();

			sql="SELECT jlflbm";
			sql+=" FROM yl_jldmb ";
			sql+=" WHERE  yldm='"+jldm+"'";
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			if(rs1.next()){
				jlflbm=rs1.getString(1);
			}
			rs1.close();
			ps1.close();


			sql="SELECT bqjzkl,sxjzkl";
			sql+=" FROM hy_hyzkb ";
			sql+=" WHERE  hyjbbh='"+hyjbbh+"' and bsflbm='"+bsflbm+"' and jlflbm='"+jlflbm+"'";
//			out.println(sql);
			ps1=conn.prepareStatement(sql);
			rs1=ps1.executeQuery();
			if(rs1.next()){
				bqjzkl=rs1.getDouble("bqjzkl");
				sxjzkl=rs1.getDouble("sxjzkl");
			}
			else{
				if (hyjbbh!=null)
				{
					out.println("���󣡲�Ʒ����"+cpbm+"��[��Ա�ۿ۱�]δ�ҵ���Ӧ����"+hyjbbh);
					return;
				}
			}
			rs1.close();
			ps1.close();

//			out.println(sxjzkl);

			hyj=(int)(yscbj*sxjzkl);

			allbqj+=bqj;

			if(cplb.equals("1")||cplb.equals("2")){    //���ݲ�Ʒ����ж��ۿ��ʣ�1,2Ϊ��ʯ�࣬3Ϊ�ؽ���
				hyzkl=xszkl;
				zkl=Math.min(Double.parseDouble(zkxx),xszkl);
			}
			else{
				hyzkl=sjzkl;
				zkl=Math.min(Double.parseDouble(zkxx),sjzkl);
			}
			//�жϸò�Ʒ�����Ƿ������Ʒ
			if (bqj==0){
				out.println("<BR>���󣬱�ǩ�۲���Ϊ0��");
				return;
			}
			shjzkl=sxj/bqj*100;     //����ʵ���ۿ���
//////////////������Ʒ��Ϣ/////////////////////////////////////////////////////
			if (zplb!=null){
				//�����Ʒ�б����Ƿ�����ò�Ʒ��Ӧ����Ϣ
				for(int j=0;j<zplb.length;j++){   
					//�����Ʒ��Ϣ�еĲ�Ʒ�����Ƿ���ò�Ʒ����һ�£���һ��˵���ò�Ʒ���۴�����Ʒ��������Ʒ����
					if(cpbm.equals(zplb[j].substring(0,13))){
						temp_zpxx=new StringTokenizer(zplb[j].substring(13),"/");   
						bj=temp_zpxx.countTokens();  
						break;//����ò�Ʒ����Ʒ��Ŀ
					}
					else {
						bj=0;
					}//end if(�ò�Ʒ������Ʒ)	      
				}//end for (����Ʒ�б�ѭ�������ò�Ʒ�Ƿ������Ʒ)
			}//end if(zplb!=null)
			zpbm="";
			zpmc="";
			for(int j=1;j<=bj;j++){ //����ȡ���ò�Ʒ��������Ʒ��������Ʒ�������ƷƷ����
				zpbm1=cf.GB2Uni(temp_zpxx.nextToken());
				sql="SELECT zpbm,xt_plbm.plmc ";
				sql+=" FROM cp_zpkc,xt_plbm ";
				sql+=" WHERE cp_zpkc.zpbm='"+zpbm1+"' AND cp_zpkc.plbm=xt_plbm.plbm and ztbm='2'";
				ps1=conn.prepareStatement(sql);
				rs1=ps1.executeQuery();
				if(rs1.next()){
					zpbm=zpbm+"/"+rs1.getString(1);    //���ַ�������"/"��ͷ��
					zpmc=zpmc+"+"+rs1.getString(2);
				} 
				else{
					out.println("<BR>������Ʒ���벻���ڣ�");
					return;
				}
				rs1.close();
				ps1.close();
			}//end for (ȡ��ÿ����Ʒ��Ʒ�����Ҵ�������)

			//�õ��������иò�Ʒ����ʾ��Ŀ�͸�ѡ��ֵ���������ݣ�����ѡ���ֵ��xslb
			xslb=cpbm+"/"+bqj+"/"+sxj+"/"+shjzkl+"/"+zkl+zpbm;
%> 
      <tr align="center"> 
        <td > <%=i+1%>
          <input type="hidden" name="xslb"  value=<%=xslb%>>
        </td>
        <td><%=cpbm%></td>
        <td><%=cplbmc%></td>
        <td><%=plmc%></td>
        <td><%=bqj%></td>
        <td><%=sxj%></td>
        <td><%=hyj%></td>
        <td><%=cf.doubleTrim(shjzkl,2)%>%</td>
        <td><%=zpjj%></td>
      </tr>
      <tr> <%        
			if(zpmc!=""){//����Ʒ����
%> 
        <td width=5% align=center bgcolor="#FFFFFF" >&nbsp;</td>
        <td width=10% align=right bgcolor="#FFFFFF" colspan="14"> ������Ʒ����:<%=zpmc.substring(1)%> 
        </td>
        <%
			}//end if
%> </tr>
      <%
		}
		else{//�Ǳ����Ʒ
			errorcpbm="true";
%> 
      <tr> 
        <td width=2%  ><%=i+1%></td>
        <td width=10%  ><%=cpbm%></td>
        <td width=70%  colspan=13 >�˲�Ʒ�����ۻ��߷Ǳ����Ʒ���������ۡ�</td>
      </tr>
      <%     
		}//�Ƿ񱾵��Ʒ
		rs.close();
		ps.close();
	}//end of for (��Ʒ�б�)
}
catch (Exception e) { 
	out.print("���ݿ����ʧ�ܣ�" + e); 
	out.print("<br>sql=" + sql); 
}
finally{ 
	try{ 
		if (rs!= null) rs.close();   
		if (ps!= null) ps.close();   
		if (rs1!= null) rs1.close();   
		if (ps1!= null) ps1.close();   
		if (conn != null) cf.close(conn);   
	}
	catch (Exception e){  
		out.println("���ݿ����ʧ�ܣ�"+e.getMessage());  
	}  
} 
allbqj=java.lang.Math.round(allbqj*100)/100.0;
allsxj=java.lang.Math.round(allsxj*100)/100.0;
%> 
      <tr align="center"> 
        <td >�� ��</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td><%=allbqj%></td>
        <td><%=allsxj%></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </div>
  <p align="center"> 
    <input type="submit"  value="��  ��" <% if (errorcpbm.equals("true")) out.println("disabled");%>>
	&nbsp;&nbsp;
    <input type="button" name="return" value="��һҳ" onclick="history.back()">
  </p>
  <input type="hidden" name="ckbm" size="20" value=<%=ckbm%>>
</form>
</body>
</html>

