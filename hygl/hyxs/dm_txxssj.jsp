<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.io.*'%>
<%@ include file="/getlogin.jsp"%>

<%
String dwbh=(String) session.getAttribute("dwbh");
String yhdlm=(String) session.getAttribute("yhdlm");
String gzrq=(String) session.getAttribute("gzrq");
String yhmc=(String) session.getAttribute("yhmc");
String yhjs=(String)session.getAttribute("yhjs");
String zgsbh=(String)session.getAttribute("zgsbh");
String zgsmc=(String)session.getAttribute("zgsmc");
String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");
if (yhjs.equals("00"))//00：总公司
{
	dwmc=zgsmc;
	dwbh=zgsbh;
}

String xsrq=request.getParameter("xsrq");     //销售日期
if (xsrq==null)
{
	xsrq=cf.today();
}
%>

<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
String ywxh1="";
int ywxh=0;
double zkxx=100;

try{
	conn=cf.getConnection();

	int count=0;

	sql="select count(*) ";
	sql+="  from cp_qmjzjl where  kcrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1)))";  
//		out.println(sql);
	ps=conn.prepareStatement(sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		count=rs.getInt(1);//从数据库中取出当前库存日期 
	} 
	rs.close();
	ps.close();
	if (count==0)
	{
		out.println("上月没有进行库存结转，不能进行库存操作！");
		return;
	}
	
	
	
	//构造业务序号，构成为年份加该年业务序号
	//首先查找该年份的业务序号（xh），如果存在则ywxh=nf+xh,否则序号（xh）为1，ywxh=nf+1
	sql="SELECT max(ywxh) FROM dm_xsjl WHERE dwbh='"+dwbh+"' AND ywxh like '"+gzrq.substring(0,4)+"%'";   
	ps=conn.prepareStatement(sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		ywxh1=rs.getString(1);
		if(ywxh1!=null) ywxh=Integer.parseInt(ywxh1.substring(4));
		ywxh=ywxh+1;
		ywxh1=(new Integer(ywxh)).toString();
	}else {
		ywxh=1;
	//组成业务序号的序号应为6位，不足则前置零
	}
	ywxh1=cf.addZero(ywxh,6);
	ywxh1=gzrq.substring(0,4)+ywxh1;

   sql="SELECT zkxx FROM sq_yhxx WHERE yhdlm='"+yhdlm+"'";    //取得操作员的折扣下限
   ps=conn.prepareStatement(sql);
   rs=ps.executeQuery();
   if(rs.next()){
       zkxx=rs.getDouble(1);
   }
   rs.close();
   ps.close();
}catch (Exception e) { 
	   out.print("数据库操作失败：" + e); 
	   return;
  }finally{ 
     try{ 
		 if(rs!=null) rs.close();
		 if (ps!= null) ps.close();  
		 if (conn != null) cf.close(conn);   
	   }catch (Exception e){  
		  out.println("数据库操作失败："+e.getMessage());  
	   }  
  } 
%>  

<HTML>
<HEAD>
<title>填写销售数据</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" onload="xhd.hykh.focus();">
<div align="center">
<form name="xhd" method="post" action="dm_xsxssj.jsp" >
    VIP销售 
    <table style="FONT-SIZE: 12px"  width=100% bgcolor=#999999 border=0 >
      <tr> 
        <td  width=13% bgcolor="#CCCCFF"> 
          <p align="right">操作员</p>
        </td>
        <td  width=39% bgcolor="#CCCCFF"><%=yhmc%> </td>
        <td  width=18% bgcolor="#CCCCFF"> 
          <div align="right">最低折扣率</div>
        </td>
        <td width=30% bgcolor="#CCCCFF"> 
          <input type="text" name="zkxx" size="5" value="<%=zkxx%>">
          % </td>
      </tr>
      <tr> 
        <td  width=13% align="right" bgcolor="#ffffff">销售单位</td>
        <td  width=39% bgcolor="#ffffff"><%=dwmc%></td>
        <td  width=18% align="right" bgcolor="#ffffff">销售日期</td>
        <td width=30% bgcolor="#ffffff"> 
          <input type="hidden" name="dwmc" value="<%=dwmc%>">
          <input type="text" name="xsrq" size="17"  maxlength="10" value="<%=xsrq%>">
        </td>
      </tr>
      <tr> 
        <td  width=13% align="right" bgcolor="#ffffff">购买原因</td>
        <td  width=39% bgcolor="#ffffff"> 
          <select name="gmyy" style="FONT-SIZE:12px;WIDTH:152px">
            <%
	cf.selectItem(out,"select xh,gmyy from hy_gmyydmb  order by xh","");
%> 
          </select>
        </td>
        <td  width=18% align="right" bgcolor="#ffffff">购买意见</td>
        <td width=30% bgcolor="#ffffff"> 
          <select name="gmyjbm" style="FONT-SIZE:12px;WIDTH:132px">
            <%
	cf.selectItem(out,"select gmyjbm,gmyjmc from hy_gmyjbm  order by gmyjbm","");
%> 
          </select>
        </td>
      </tr>
      <tr> 
        <td  width=13% align="right" bgcolor="#ffffff">水质分析卡号</td>
        <td colspan="3" bgcolor="#ffffff"> 
          <input type="text" name="hykh" size="12" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid" onKeyUp="hykhKey(xhd)">
          会员编号
			<input type="text" name="hybh" size="10" maxlength="10" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
          姓名 
          <input type="text" name="hyxm" size="6" maxlength="18" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
          级别 
          <input type="text" name="hyjb" size="7" maxlength="18" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
        </td>
      </tr>
      <tr> 
        <td  width=13% align="right" bgcolor="#ffffff">产品编码</td>
        <td  width=39% bgcolor="#ffffff"> 
          <input type="text" name="cpbm" size="20" maxlength="13" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid"  onKeyUp="cpbmKey(xhd)"  onFocus="enableButton(document.xhd.jrcplb);">
        </td>
        <td  width=18% align="right" bgcolor="#ffffff">&nbsp;</td>
        <td width=30% bgcolor="#ffffff">&nbsp; </td>
      </tr>
      <tr> 
        <td  width=13% bgcolor="#ffffff" align="right">标签价</td>
        <td colspan="3" bgcolor="#ffffff"> 
          <input type="text" name="bqj" size="6"  maxlength="16"  style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
          金重 
          <input type="text" name="jlzl" size="4"  maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
          品名 
          <input type="text" name="plmc" size="16" maxlength="18" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
          证书号 
          <input type="text" name="zsh" size="12" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
        </td>
      </tr>
      <tr> 
        <td  width=13% bgcolor="#ffffff"> 
          <div align="right">实销价</div>
        </td>
        <td  width=39% bgcolor="#ffffff"> 
          <input type="text" name="sxj" size="13"  maxlength="16" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid"  onKeyUp="sxjKey(xhd)">
          <input type="text" name="count" size="4" style="border-color: #FFFFFF #FFFFFF #000000 ;border-style:solid">
        </td>
        <td  width=18% bgcolor="#ffffff"> 
          <div align="right">赠品编码</div>
        </td>
        <td width=30% bgcolor="#ffffff"> 
          <input type="text" name="zpbm" size="17" maxlength="13" value="0000000000001" onKeyUp="zpbmKey(xhd)">
        </td>
      </tr>
      <tr bgcolor=#CCCCCC> 
        <td colspan="2"  align="center">产品列表 </td>
        <td colspan="2"  align="center">赠品列表</td>
      </tr>
      <tr> 
        <td  valign="middle" colspan="2" bgcolor="#ffffff"> 
          <p align="center"> <font size="2"> 
            <input type="button" name="jrcplb" value="加入产品" onClick="addProcuct(document.xhd);">
            <input type="button" name="sccp" value="删除产品" onClick="delItemOfCplb(document.xhd.cplb);">
            <input type="button" name="qkcplb" value="清空列表" onClick="resetCplb(document.xhd.cplb);">
            <select  name="cplb" style="font-size: width 275; height: 156; width: 259"  size="12" multiple>
            </select>
            </font></p>
        </td>
        <td  colspan="2" valign="top" bgcolor="#ffffff"> 
          <div align="center"><font size="2"> 
            <input type="button" name="jrzplb" value="加入赠品" onClick="addZp(document.xhd);">
            <input type="button" name="sczp" value="删除赠品" onClick="delItem(document.xhd.zplb);">
            <input type="button" name="qkzplb" value="清空列表" onClick="resetList(document.xhd.zplb);">
            <select style="font-size: 14px; width: 250; height: 156" name="zplb" size="12" multiple>
            </select>
            </font></div>
        </td>
      </tr>
      <tr> 
        <td  colspan=4> 
          <p align="center"> 
            <input  type=button  value="下一步" name="xyb" onClick="submit_Check(document.xhd);">
            &nbsp;&nbsp;&nbsp; 
            <input type=reset value="重  置">
          </p>
        </td>
      </tr>
    </table>   
  </form>   
</div>   
</body>   
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>                                                   
<SCRIPT language=javascript >  

function cpbmKey(FormName)
{
	if (event.keyCode==13)	
	{
		if (FormName.cpbm.value.length==13){                                                                                                         
			if(	javaTrim(FormName.hykh)=="") {
				alert("请输入[水质分析卡号]！");
				FormName.hykh.select();
				return false;
			}
			parent.menu.aform.action="cpbmcx.jsp?dwbh=<%=dwbh%>&cpbm="+FormName.cpbm.value+"&hykh="+FormName.hykh.value;
			parent.menu.aform.submit();
		}        
	}
}

function hykhKey(FormName)
{
	if (event.keyCode==13)	
	{
		if(	javaTrim(FormName.hykh)=="") {
			alert("请输入[水质分析卡号]！");
			FormName.hykh.select();
			return false;
		}
		parent.menu.aform.action="cpbmcx.jsp?hykh="+FormName.hykh.value;
		parent.menu.aform.submit();
	}
}

function sxjKey(FormName)
{
//	alert(event.keyCode);
	if (event.keyCode==13)	
	{
		addProcuct(FormName);
//		FormName.cpbm.value="";
//		FormName.sxj.value="";
		FormName.count.value=FormName.cplb.options.length ;              
		FormName.cpbm.select();
	}
}

//将一个产品及其实销价加入产品列表    
function addProcuct(fm){   
   if((fm.cpbm.value=="")||(fm.cpbm.value.length==check(fm.cpbm.value))){   
      alert("请输入产品编码！");   
	  fm.cpbm.focus();   
	  return false;   
   }   
   if (!isNumber(fm.cpbm,"产品条码")){     
     fm.cpbm.select();     
     return false;   
   }   
   if (fm.cpbm.value.length!=13){   
      alert("您输入的产品编码位数不正确，请重新输入！");   
	  fm.cpbm.select();   
	  return false;   
   } 
   if(isExistedInLb(fm.cplb,fm.cpbm.value)!=-1){ 
      alert("产品列表中已存在该产品！"); 
      fm.cpbm.select(); 
      return false; 
   } 
   if((fm.sxj.value=="")||fm.sxj.value.length==check(fm.sxj.value)){   
      alert("请输入实销价格！");   
	  fm.sxj.focus();   
	  return false;   
   }   
   if(!(isFloat(fm.sxj,"实销价格"))){   
	  fm.sxj.select();   
	  return false;   
   }   
   addValue=fm.cpbm.value+"/"+fm.sxj.value;   
   addOne(fm.cplb,addValue);   
   fm.jrcplb.disabled=true;   
}   


function zpbmKey(FormName)
{
//	alert(event.keyCode);
	if (event.keyCode==13)	
	{
		addZp(FormName);
//		FormName.zpbm.value="";
		FormName.zpbm.select();
	}
}


//计算编辑框中的空格数
function check(field){   
   var num=0;   
   for(i=0;i<field.length;i++){   
      cha=field.charAt(i);   
      if(cha==' '){num=num+1;}   
   }   
   return num;   
}  

//在产品或赠品列表中判断是否已存在该产品   
function isExistedInLb(o,val){    
  var index=0;     
  var bm;     
  while (index<o.length){     
     bm=o.options[index].value.substr(0,13);     
     if (bm==val) return index;     
     index++; 
  }     
  return -1;     
}   

//在列表中加入一项	   
function addOne(o,addValue){     
   o.length = o.length+1;    
   xh=o.length;
   o.options[o.length-1].value =addValue;  
   o.options[o.length-1].text = o.length +":"+ addValue;  
}     
   
   
//将产品及其赠品加入赠品列表   
function addZp(fm){   
   index1=isExistedInLb(fm.zplb,fm.cpbm.value);   
   index2=isExistedInLb(fm.cplb,fm.cpbm.value);   
   if((fm.cpbm.value=="")||fm.cpbm.value.length==check(fm.cpbm.value)){   
      alert("请输入产品编码！");   
	  fm.cpbm.focus();   
	  return   
   }   
   if((fm.zpbm.value=="")||fm.zpbm.value.length==check(fm.zpbm.value)){   
      alert("请输入赠品编码！");   
	  fm.zpbm.focus();   
	  return   
   }   
   if (!isNumber(fm.cpbm,"产品条码")){     
     fm.cpbm.select();     
     return      
   }   
/*
   if (!isNumber(fm.zpbm,"赠品条码")){     
     fm.zpbm.select();     
     return      
   }   
*/
   if (fm.cpbm.value.length!=13){   
      alert("您输入的产品编码位数不正确，请重新输入！");   
	  fm.cpbm.select();   
	  return   
   }   
   if (fm.zpbm.value.length!=13){   
      alert("您输入的赠品编码位数不正确，请重新输入！");   
	  fm.zpbm.select();   
	  return   
   }   
   if(index2==-1){   
      alert("请选择产品列表中已有的产品！");   
	  fm.cpbm.select();   
	  return   
   }   
   if (index1==-1){   
      addValue=fm.cpbm.value+"/"+fm.zpbm.value;   
      addOne(fm.zplb,addValue);   
   }   
   if (index1!=-1){   
      fm.zplb.options[index1].text=fm.zplb.options[index1].text+"/"+fm.zpbm.value; 
      fm.zplb.options[index1].value=fm.zplb.options[index1].value+"/"+fm.zpbm.value;   
   }   
}   

//删除产品列表项,同时删除赠品列表中该产品的相关信息   
function delItemOfCplb(listname){   
   index = listname.selectedIndex;   
   if(index<0){
      alert("请至少选择一件产品");
      return;
   }
   while (index != -1){   
      opt1=listname.options[index].value;
      opt1=opt1.substr(0,13);
      for(i=0;i<document.xhd.zplb.length;i++){
	 opt2=document.xhd.zplb.options[i].value;
	 opt2=opt2.substr(0,13);
	 if(opt1==opt2){
	    document.xhd.zplb.options[i]=null;
	 }//end if
      }//end for loop
      listname.options[index]=null;   
      index=listname.selectedIndex; 
   } //end while loop 
   for(i=1;i<=listname.length;i++){
      listname.options[i-1].text=i+":"+listname.options[i-1].value;
   }//end for loop
   for(i=1;i<=document.xhd.zplb.length;i++){
      document.xhd.zplb.options[i-1].text=i+":"+document.xhd.zplb.options[i-1].value;
   }//end for loop
	document.xhd.count.value=listname.options.length ;              
}   

//删除赠品列表中的列表项   
function delItem(listname){   
   index = listname.selectedIndex;
   if(index<0){
      alert("请至少选择一件赠品");
      return;
   }
   while (index != -1){   
      listname.options[index]=null;   
      index=listname.selectedIndex; 
   } //end of while loop
   for(i=1;i<=listname.length;i++){
      listname.options[i-1].text=i+":"+listname.options[i-1].value;
   }//end for loop
}   

//清空产品列表，同时清空赠品列表   
function resetCplb(listname){   
   while (listname.length>0){   
      listname.options[0]=null;   
   } //end of while loop   
   resetList(document.xhd.zplb);
	document.xhd.count.value=document.xhd.zplb.options.length ;              
}   

//清空赠品列表   
function resetList(listname){   
   while (listname.length>0){   
      listname.options[0]=null;   
   } //end of while loop   
}   

//使按钮可用 
function enableButton(bu){   
   bu.disabled=false;   
}   
 
//提交表单之前进行合法性检验
function submit_Check(fm){   
	if(!(isDatetime(fm.xsrq, "销售日期"))) {
		return false;
	}
   if(fm.xsrq.value>'<%=cf.today()%>'){   
      alert("[销售日期]不能大于[当前日期]！");   
	  fm.xsrq.focus();   
	  return   
   } 

	var mon=parseInt("1"+fm.xsrq.value.substr(5,7))-100;
	var mon1=parseInt(<%=cf.today("MM")%>);
//	alert(mon);
//	alert(mon1);
	if(mon1-mon>1){   
		alert("不能跨月销售！");   
		fm.xsrq.focus();   
		return   
	}   

/*
	if(	javaTrim(fm.gmyy)=="") {
		alert("请输入[购买原因]！");
		fm.gmyy.focus();
		return false;
	}
	if(	javaTrim(fm.gmyjbm)=="") {
		alert("请输入[购买意见]！");
		fm.gmyjbm.focus();
		return false;
	}
   if((fm.hykh.value!="") && fm.hykh.value.length!=check(fm.hykh.value)){  
      if(fm.hykh.value.length!=11) {  
         alert("您输入的水质分析卡号位数不正确，请重新输入！");  
         fm.hykh.select();   
         return  
      }  
   }
   if((fm.ywxh.value=="")||fm.ywxh.value.length==check(fm.ywxh.value)){   
      alert("请输入业务序号！");   
      fm.ywxh.focus();   
      return   
   }   
   if (!(isNumber(fm.ywxh,"业务序号"))){     
     fm.ywxh.select();     
     return      
   }  
   if(fm.ywxh.value.length!=10) {  
      alert("您输入的业务序号位数不正确，请重新输入！");  
      fm.ywxh.select();   
      return  
   }  
*/

   if(fm.cplb.length==0){   
      alert("请选择产品！");   
		fm.cpbm.focus();
	  return   
   }else{   
      for(i=0;i<fm.cplb.length;i++){                                                                      
        fm.cplb.options[i].selected = true;                                                                      
      }                                                                                                                     
   }   
   if(fm.zplb.length>0){   
      for(i=0;i<fm.zplb.length;i++){                                                                      
        fm.zplb.options[i].selected = true;                                                                      
      }    
   }   
   fm.submit();   
}   
</SCRIPT>