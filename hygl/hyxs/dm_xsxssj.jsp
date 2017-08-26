<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<html>
<head>

<title>销售数据</title>
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

	//读取会员基本信息以及会员的折扣率
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
			out.println("<BR>不存在的水质分析卡号！");
			return;
		}
		rs.close();
		ps.close();

		if(sfzf.equals("Y")){//是否作废,0为作废，1为未作废
			out.println("<BR>水质分析卡号已经作废！");
			return;
		}
	}

//判断赠品是否存在
   int fszp=0;//附属赠品
   if ((zplb!=null)&&(zplb.length>0)){
       fszp=1;
   }
%>
<p align="center">销售票据</p>
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
        <td  width="20%" align="right">购买地点</td>
        <td  width="30%"> 
          <p align="left"><%=dwmc%></p>
        </td>
        <td  width="22%" align="right">水质分析卡号</td>
        <td  width="28%"><%=hykh%></td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td width="20%" height="1" align="right">会员名称</td>
        <td width="30%" height="1"><%=hyxm%></td>
        <td width="22%" height="20" align="right">会员编号</td>
        <td width="28%" height="1"><%=hybh%></td>
      </tr>
      <tr bgcolor=#ffffff> 
        <td width="20%" height="1" align="right">操作员折扣率 </td>
        <td width="30%" height="1"><%=zkxx%>%</td>
        <td width="22%" height="20" align="right">会员级别</td>
        <td width="28%" height="1"><%=hyjb%></td>
      </tr>
    </table>
  </div>
   <div align="center">
    <table border="1" width=100% bgcolor="#FFFFFF" height="1" cellspacing="0" cellpadding="1"  style="FONT-SIZE:12">
      <tr bgcolor="#e8e8ff" align="center"> 
        <td width="5%" >序号</td>
        <td width="7%"  >产品条码</td>
        <td width="7%"  >产品类别</td>
        <td width="15%"  >产品名称</td>
        <td width="7%"  >标签价</td>
        <td width="7%"  >实销价</td>
        <td width="7%"  >会员价</td>
        <td width="7%"  >实际折扣率</td>
        <td width="7%" >出库带赠品</td>
      </tr>
      <%
   //显示销售数据
	for(int i=0;i<cpxx.length;i++){
		bj=0;
		bqj=sxj=0;//零售价、标签价、特价、实销价
		shjzkl=zkl=hyzkl=100;//实际折扣率、折扣率、会员折扣率
//		out.println(cpxx[i]);
		cpbm=cpxx[i].substring(0,13);//产品编码
		temp_sxj=cpxx[i].substring(14);//实销价
		sxj=Double.parseDouble(temp_sxj);
		allsxj+=sxj;
		
		//取出该产品的其他信息（品名名称、版库编号、品类名称、零售价、标签价、特价、产品类别、品类编码）
		sql="SELECT ckbm,bkbh,xt_plbm.plmc,bqj,cplb,DECODE(zpjj,0,'否',1,'是'),DECODE(cp_cpxx.cplb,'B','素金类','A','镶嵌类') cplbmc,cp_cpxx.jldm,cp_cpxx.bsczbm,yscbj";
		sql+=" FROM cp_cpxx,xt_plbm ";
		sql+=" WHERE  cp_cpxx.plbm=xt_plbm.plbm";
		sql+=" and cp_cpxx.cpbm='"+cpbm+"' AND szdw='"+dwbh+"' and wlzt='00'";
//		out.println(sql);
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next()){//是本店产品
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
					out.println("错误！产品条码"+cpbm+"在[会员折扣表]未找到对应参数"+hyjbbh);
					return;
				}
			}
			rs1.close();
			ps1.close();

//			out.println(sxjzkl);

			hyj=(int)(yscbj*sxjzkl);

			allbqj+=bqj;

			if(cplb.equals("1")||cplb.equals("2")){    //根据产品类别判断折扣率，1,2为镶石类，3为素金类
				hyzkl=xszkl;
				zkl=Math.min(Double.parseDouble(zkxx),xszkl);
			}
			else{
				hyzkl=sjzkl;
				zkl=Math.min(Double.parseDouble(zkxx),sjzkl);
			}
			//判断该产品出库是否带有赠品
			if (bqj==0){
				out.println("<BR>错误，标签价不能为0！");
				return;
			}
			shjzkl=sxj/bqj*100;     //计算实际折扣率
//////////////处理赠品信息/////////////////////////////////////////////////////
			if (zplb!=null){
				//检查赠品列表中是否有与该产品对应的信息
				for(int j=0;j<zplb.length;j++){   
					//检查赠品信息中的产品编码是否与该产品编码一致，若一致说明该产品销售带有赠品，计算赠品数量
					if(cpbm.equals(zplb[j].substring(0,13))){
						temp_zpxx=new StringTokenizer(zplb[j].substring(13),"/");   
						bj=temp_zpxx.countTokens();  
						break;//计算该产品的赠品数目
					}
					else {
						bj=0;
					}//end if(该产品带有赠品)	      
				}//end for (对赠品列表循环，检查该产品是否带有赠品)
			}//end if(zplb!=null)
			zpbm="";
			zpmc="";
			for(int j=1;j<=bj;j++){ //依次取出该产品的所有赠品（包括赠品编码和赠品品名）
				zpbm1=cf.GB2Uni(temp_zpxx.nextToken());
				sql="SELECT zpbm,xt_plbm.plmc ";
				sql+=" FROM cp_zpkc,xt_plbm ";
				sql+=" WHERE cp_zpkc.zpbm='"+zpbm1+"' AND cp_zpkc.plbm=xt_plbm.plbm and ztbm='2'";
				ps1=conn.prepareStatement(sql);
				rs1=ps1.executeQuery();
				if(rs1.next()){
					zpbm=zpbm+"/"+rs1.getString(1);    //该字符串是以"/"开头的
					zpmc=zpmc+"+"+rs1.getString(2);
				} 
				else{
					out.println("<BR>错误，赠品编码不存在！");
					return;
				}
				rs1.close();
				ps1.close();
			}//end for (取出每个赠品的品名并且串接起来)

			//得到销货单中该产品的显示条目和复选框值（销售数据），复选框的值是xslb
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
			if(zpmc!=""){//带赠品销售
%> 
        <td width=5% align=center bgcolor="#FFFFFF" >&nbsp;</td>
        <td width=10% align=right bgcolor="#FFFFFF" colspan="14"> 附属赠品名称:<%=zpmc.substring(1)%> 
        </td>
        <%
			}//end if
%> </tr>
      <%
		}
		else{//非本店产品
			errorcpbm="true";
%> 
      <tr> 
        <td width=2%  ><%=i+1%></td>
        <td width=10%  ><%=cpbm%></td>
        <td width=70%  colspan=13 >此产品已销售或者非本店产品，不可销售。</td>
      </tr>
      <%     
		}//是否本店产品
		rs.close();
		ps.close();
	}//end of for (产品列表)
}
catch (Exception e) { 
	out.print("数据库操作失败：" + e); 
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
		out.println("数据库操作失败："+e.getMessage());  
	}  
} 
allbqj=java.lang.Math.round(allbqj*100)/100.0;
allsxj=java.lang.Math.round(allsxj*100)/100.0;
%> 
      <tr align="center"> 
        <td >合 计</td>
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
    <input type="submit"  value="销  售" <% if (errorcpbm.equals("true")) out.println("disabled");%>>
	&nbsp;&nbsp;
    <input type="button" name="return" value="上一页" onclick="history.back()">
  </p>
  <input type="hidden" name="ckbm" size="20" value=<%=ckbm%>>
</form>
</body>
</html>

